import Sys.*;
import Tools.removeDirectory;
import haxe.Json;
import sys.FileSystem.*;
import sys.io.File.*;

/** Runs the script. **/
function main() {
	if (exists("docs/api")) removeDirectory("docs/api");
	command("haxe --define doc-gen --no-output --xml var/api.xml build.hxml");

	final version = Json.parse(getContent("haxelib.json")).version;
	command("lix", [
		"run", "dox",
		"--define", "description", "Bundle providing Bootstrap and Bootstrap Icons in one Haxe package.",
		"--define", "source-path", "https://github.com/cedx/bootstrap.hx/blob/main/src",
		"--define", "themeColor", "0xffc105",
		"--define", "version", version,
		"--define", "website", "https://cedx.github.io/bootstrap.hx",
		"--exclude", "^bootstrap\\.cli\\.",
		"--input-path", "var",
		"--output-path", "docs/api",
		"--title", "Bootstrap Bundle for Haxe",
		"--toplevel-package", "bootstrap"
	]);

	copy("docs/favicon.ico", "docs/api/favicon.ico");
}
