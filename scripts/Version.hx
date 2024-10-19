//! --class-path src
import bootstrap.Platform;
import haxe.DynamicAccess;
import haxe.Json;
import sys.io.File;

/** Updates the version number in the sources. **/
function main() {
	replaceInFile("package.json", ~/"version": "\d+(\.\d+){2}"/, '"version": "${Platform.packageVersion}"');

	final dependencies: DynamicAccess<String> = Json.parse(File.getContent("package.json")).dependencies;
	for (library in ["bootstrap", "bootstrap-icons"]) {
		final version = dependencies[library].substr(1);
		replaceInFile("README.md", new EReg('$library/v\\d+(\\.\\d+){2}', ""), '$library/v$version');
	}
}

/** Replaces in the specified `file` the substring which the `pattern` matches with the given `replacement`. **/
private function replaceInFile(file: String, pattern: EReg, replacement: String)
	File.saveContent(file, pattern.replace(File.getContent(file), replacement));
