//! --class-path src
import bootstrap.Platform;
import haxe.DynamicAccess;
import haxe.Json;
import sys.io.File;

/** Updates the version number in the sources. **/
function main() {
	Tools.replaceInFile("package.json", ~/"version": "\d+(\.\d+){2}"/, '"version": "${Platform.packageVersion}"');

	final dependencies: DynamicAccess<String> = Json.parse(File.getContent("package.json")).dependencies;
	for (library in ["bootstrap", "bootstrap-icons"]) {
		final version = dependencies[library].substr(1);
		Tools.replaceInFile("README.md", new EReg('$library/v\\d+(\\.\\d+){2}', ""), '$library/v$version');
	}
}
