import {spawn} from "node:child_process";
import {createWriteStream, existsSync, readFileSync} from "node:fs";
import {cp} from "node:fs/promises";
import archiver from "archiver";
import del from "del";
import gulp from "gulp";
import replace from "gulp-replace";
import merge from "merge2";

// The package configuration.
const pkg = JSON.parse(readFileSync("haxelib.json", "utf8"));

/** The default task. */
export default gulp.series(
	clean,
	build,
	buildIcons,
	version
);

/** Builds the project. */
export async function build() {
	const mapping = [
		["bootstrap/dist/css", "css"],
		["bootstrap/dist/js", "js"],
		["bootstrap/scss", "scss"],
		["bootstrap-icons/icons", "icons"],
		["bootstrap-icons/font/fonts", "fonts"]
	];

	await exec("haxe", ["run.hxml"]);
	for (const [source, destination] of mapping) await cp(`node_modules/${source}`, `lib/${destination}`, {recursive: true});
	return del("lib/**/*.map");
}

/** Builds the icon font. */
export function buildIcons() {
	const streams = ["css", "scss"].map(extension => [
		gulp.src(`node_modules/bootstrap-icons/font/bootstrap-icons.${extension}`).pipe(gulp.dest(`lib/${extension}`)),
		gulp.src(`lib/${extension}/bootstrap-icons.${extension}`).pipe(replace(/\.\/fonts\//g, "../fonts/")).pipe(gulp.dest(`lib/${extension}`))
	]);

	return merge(...streams.flat());
}

/** Deletes all generated files and reset any saved state. */
export function clean() {
	return del(["lib", "res", "var/**/*"]);
}

/** Builds the documentation. */
export async function doc() {
	await del("docs");
	await exec("haxe", ["--define", "doc-gen", "--no-output", "--xml", "var/api.xml", "build.hxml"]);
	await exec("lix", [
		"run", "dox",
		"--define", "description", '"Bundle providing Bootstrap and Bootstrap Icons in one Haxe package."',
		"--define", "source-path", "https://github.com/cedx/bootstrap.hx/blob/main/src",
		"--define", "themeColor", "0xffc105",
		"--define", "version", pkg.version,
		"--define", "website", "https://github.com/cedx/bootstrap.hx",
		"--input-path", "var",
		"--output-path", "docs",
		"--title", '"Bootstrap Bundle for Haxe"',
		"--toplevel-package", "js.bootstrap"
	]);

	return cp("www/favicon.ico", "docs/favicon.ico");
}

/** Installs the project dependencies. */
export async function install() {
	await exec("lix", ["download"]);
	return exec("npm", [existsSync("package-lock.lock") ? "install" : "update"]);
}

/** Performs the static analysis of source code. */
export async function lint() {
	await exec("lix", ["run", "checkstyle", "--config", "etc/checkstyle.json", "--source src"]);
	return exec("npx", ["tsc", "--project", "jsconfig.json"]);
}

/** Publishes the package in the registry. */
export async function publish() {
	await del("var/haxelib.zip");

	const archive = archiver("zip");
	const output = createWriteStream("var/haxelib.zip");
	archive.on("error", error => { throw error; }).pipe(output);
	archive.glob("*.md").glob("haxelib.json").glob("run.n").directory("lib", "lib").directory("src", "src").finalize();

	await exec("haxelib", ["submit", "var/haxelib.zip"]);
	for (const command of [["tag"], ["push", "origin"]]) await exec("git", [...command, `v${pkg.version}`]);
}

/** Updates the version numbers in the sources. */
export function version() {
	const {dependencies} = JSON.parse(readFileSync("package.json", "utf8"));
	return gulp.src(["README.md", "package.json"])
		.pipe(replace(/bootstrap\/v\d+(\.\d+){2}/, `bootstrap/v${dependencies.bootstrap.substring(1)}`))
		.pipe(replace(/bootstrap-icons\/v\d+(\.\d+){2}/, `bootstrap-icons/v${dependencies["bootstrap-icons"].substring(1)}`))
		.pipe(replace(/"version": "\d+(\.\d+){2}"/, `"version": "${pkg.version}"`))
		.pipe(gulp.dest("."));
}

/**
 * Spawns a new process using the specified command.
 * @param {string} command The command to run.
 * @param {string[]} [args] The command arguments.
 * @returns {Promise<void>} Resolves when the command is finally terminated.
 */
function exec(command, args = []) {
	return new Promise((resolve, reject) => spawn(command, args, {shell: true, stdio: "inherit"})
		.on("close", code => code ? reject(new Error(args.length ? `${command} ${args.join(" ")}` : command)) : resolve()));
}
