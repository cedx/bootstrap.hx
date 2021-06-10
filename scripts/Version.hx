import Tools.updateFile;
import haxe.DynamicAccess;
import haxe.Json;
import sys.io.File.*;

/** Runs the script. **/
function main() {
	final version = Json.parse(getContent("haxelib.json")).version;
	updateFile("package.json", ~/"version": "\d+(\.\d+){2}"/, '"version": "$version"');

	final dependencies: DynamicAccess<String> = Json.parse(getContent("package.json")).dependencies;
	updateFile("src/bootstrap/Version.hx", ~/bootstrap = "\d+(\.\d+){2}"/, 'bootstrap = "${dependencies["bootstrap"].substring(1)}"');
	updateFile("src/bootstrap/Version.hx", ~/bootstrapIcons = "\d+(\.\d+){2}"/, 'bootstrapIcons = "${dependencies["bootstrap-icons"].substring(1)}"');
}
