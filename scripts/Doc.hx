//! --class-path src --library tink_cli
import Sys.*;
import Tools.removeDirectory;
import bootstrap.cli.Version.*;
import sys.FileSystem.*;
import sys.io.File.*;

/** Runs the script. **/
function main() {
	if (exists("docs")) removeDirectory("docs");

	command("haxe --define doc-gen --no-output --xml var/api.xml build.hxml");
	command("lix", [
		"run", "dox",
		"--define", "description", "Bundle providing Bootstrap and Bootstrap Icons in one Haxe package.",
		"--define", "source-path", "https://bitbucket.org/cedx/bootstrap.hx/src/main/src",
		"--define", "themeColor", "0xffc105",
		"--define", "version", packageVersion,
		"--define", "website", "https://bitbucket.org/cedx/bootstrap.hx",
		"--include", "js\\.bootstrap\\.*",
		"--input-path", "var",
		"--output-path", "docs",
		"--title", "Bootstrap Bundle for Haxe",
		"--toplevel-package", "js.bootstrap"
	]);

	copy("www/favicon.ico", "docs/favicon.ico");
}
