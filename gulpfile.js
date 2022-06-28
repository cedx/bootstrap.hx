import {createWriteStream, existsSync} from "node:fs";
import {cp, rm} from "node:fs/promises";
import archiver from "archiver";
import del from "del";
import {execa} from "execa";
import log from "fancy-log";
import gulp from "gulp";
import replace from "gulp-replace";
import merge from "merge2";
import haxelib from "./haxelib.json" assert {type: "json"};
import pkg from "./package.json" assert {type: "json"};

/** Builds the project. */
export const build = gulp.series(
	async function copyAssets() {
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
	},
	function updateAssets() {
		return merge(["css", "scss"].map(type => gulp.src(`node_modules/bootstrap-icons/font/bootstrap-icons.${type}`)
			.pipe(replace(/\.\/fonts\//g, "../fonts/"))
			.pipe(gulp.dest(`lib/${type}`))));
	}
);

/** Deletes all generated files and reset any saved state. */
export function clean() {
	return del(["lib", "res", "var/**/*"]);
}

/** Builds the documentation. */
export async function doc() {
	await rm("docs", {force: true, recursive: true});
	await exec("haxe", ["--define", "doc-gen", "--no-output", "--xml", "var/api.xml", "build.hxml"]);
	await exec("lix", [
		"run", "dox",
		"--define", "description", "Bundle providing Bootstrap and Bootstrap Icons in one Haxe package.",
		"--define", "source-path", "https://github.com/cedx/bootstrap.hx/blob/main/src",
		"--define", "themeColor", "0xffc105",
		"--define", "version", haxelib.version,
		"--define", "website", "https://github.com/cedx/bootstrap.hx",
		"--input-path", "var",
		"--output-path", "docs",
		"--title", "Bootstrap Bundle for Haxe",
		"--toplevel-package", "js.bootstrap"
	]);

	return cp("www/favicon.ico", "docs/favicon.ico");
}

/** Installs the project dependencies. */
export async function install() {
	await exec("lix", ["download"]);
	return exec("npm", [existsSync("package-lock.json") ? "install" : "update"]);
}

/** Performs the static analysis of source code. */
export async function lint() {
	await exec("lix", ["run", "checkstyle", "--config", "etc/checkstyle.json", "--exitcode", "--source", "src"]);
	return exec("tsc", ["--project", "jsconfig.json"]);
}

/** Publishes the package in the registry. */
export async function publish() {
	await rm("var/haxelib.zip", {force: true});

	const archive = archiver("zip");
	const output = createWriteStream("var/haxelib.zip");
	archive.on("error", error => { throw error; }).pipe(output);
	archive.glob("*.md").glob("haxelib.json").glob("run.n").directory("lib", "lib").directory("src", "src").finalize();

	for (const command of [["tag"], ["push", "origin"]]) await exec("git", [...command, `v${haxelib.version}`]);
	log("The package is ready to be published using 'haxelib submit var/haxelib.zip'.");
}

/** Updates the version numbers in the sources. */
export function version() {
	return gulp.src(["README.md", "package.json"])
		.pipe(replace(/bootstrap\/v\d+(\.\d+){2}/, `bootstrap/v${pkg.dependencies.bootstrap.substring(1)}`))
		.pipe(replace(/bootstrap-icons\/v\d+(\.\d+){2}/, `bootstrap-icons/v${pkg.dependencies["bootstrap-icons"].substring(1)}`))
		.pipe(replace(/"version": "\d+(\.\d+){2}"/, `"version": "${haxelib.version}"`))
		.pipe(gulp.dest("."));
}

/** Runs the default task. */
export default gulp.series(
	clean,
	build,
	version
);

/**
 * Runs the specified command.
 * @param {string} command The command to run.
 * @param {string[]} [args] The command arguments.
 * @param {import("execa").Options} [options] The child process options.
 * @returns {import("execa").ExecaChildProcess} Resolves when the command is finally terminated.
 */
function exec(command, args = [], options = {}) {
	return execa(command, args, {preferLocal: true, stdio: "inherit", ...options});
}
