//! --class-path src
import bootstrap.Version;
import sys.FileSystem;
import sys.io.File;

/** Runs the script. **/
function main() {
	if (FileSystem.exists("docs")) Tools.removeDirectory("docs");

	Sys.command("haxe", ["--define", "doc-gen", "--no-output", "--xml", "var/api.xml", "build.hxml"]);
	Sys.command("lix", [
		"run", "dox",
		"--define", "description", "Bundle providing Bootstrap and Bootstrap Icons in one Haxe package.",
		"--define", "source-path", "https://github.com/cedx/bootstrap.hx/blob/main/src",
		"--define", "themeColor", "0xffc105",
		"--define", "version", Version.packageVersion,
		"--define", "website", "https://github.com/cedx/bootstrap.hx",
		"--input-path", "var",
		"--output-path", "docs",
		"--title", "Bootstrap Bundle for Haxe",
		"--toplevel-package", "js.bootstrap"
	]);

	File.copy("www/favicon.ico", "docs/favicon.ico");
}
