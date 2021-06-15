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
	final versions = [
		"bootstrap" => {pack: "bootstrap", version: dependencies["bootstrap"].substring(1)},
		"bootstrapIcons" => {pack: "bootstrap-icons", version: dependencies["bootstrap-icons"].substring(1)}
	];

	for (field => lib in versions)
		updateFile("src/bootstrap/Version.hx", new EReg('$field = "\\d+(\\.\\d+){2}"', ""), '$field = "${lib.version}"');

	for (lib in versions) for (file in ["README.md", "docs/README.md"])
		updateFile(file, new EReg('${lib.pack}/v\\d+(\\.\\d+){2}', ""), '${lib.pack}/v${lib.version}');
}
