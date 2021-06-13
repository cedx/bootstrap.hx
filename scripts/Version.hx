//! --class-path src --library tink_cli --library tink_core
import Tools.updateFile;
import bootstrap.cli.Version.*;
import haxe.DynamicAccess;
import haxe.Json;
import sys.io.File.*;

/** Runs the script. **/
function main() {
	final version = getPackageVersion();
	updateFile("package.json", ~/"version": "\d+(\.\d+){2}"/, '"version": "$version"');

	final dependencies: DynamicAccess<String> = Json.parse(getContent("package.json")).dependencies;
	for (file in ["README.md", "docs/README.md"])
		for (lib in ["bootstrap", "bootstrap-icons"]) updateFile(file, new EReg('$lib/v\\d+(\\.\\d+){2}', ""), '$lib/v${dependencies[lib].substring(1)}');
}
