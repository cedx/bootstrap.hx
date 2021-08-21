//! --class-path src --library tink_cli --library tink_core
import Sys.*;
import Tools.removeDirectory;
import bootstrap.cli.Version.*;
import sys.FileSystem.*;
import sys.io.File.*;

/** Runs the script. **/
function main() {
	if (exists("docs/api")) removeDirectory("docs/api");

	command("haxe --define doc-gen --no-output --xml var/api.xml build.hxml");
	command("lix", [
		"run", "dox",
		"--define", "description", "Bundle providing Bootstrap and Bootstrap Icons in one Haxe package.",
		"--define", "source-path", "https://github.com/cedx/bootstrap.hx/blob/main/src",
		"--define", "themeColor", "0xffc105",
		"--define", "version", getPackageVersion(),
		"--define", "website", "https://cedx.github.io/bootstrap.hx",
		"--include", "js\\.bootstrap\\.*",
		"--input-path", "var",
		"--output-path", "docs/api",
		"--title", "Bootstrap Bundle for Haxe",
		"--toplevel-package", "js.bootstrap"
	]);

	copy("docs/favicon.ico", "docs/api/favicon.ico");
}
