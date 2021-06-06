import Tools.updateFile;
import haxe.Json;
import sys.io.File.*;

/** Runs the script. **/
function main() {
	final version = Json.parse(getContent("haxelib.json")).version;
	updateFile("package.json", ~/"version": "\d+(\.\d+){2}"/, '"version": "$version"');
}