//! --class-path src --library tink_cli --library tink_core
import Tools.replaceInFile;
import bootstrap.cli.Version.*;
import haxe.DynamicAccess;
import haxe.Json;
import sys.io.File.*;

/** Runs the script. **/
function main() {
	final version = getPackageVersion();
	replaceInFile("package.json", ~/"version": "\d+(\.\d+){2}"/, '"version": "$version"');

	final dependencies: DynamicAccess<String> = Json.parse(getContent("package.json")).dependencies;
	final versions = [
		{field: "bootstrap", pack: "bootstrap", version: dependencies["bootstrap"].substring(1)},
		{field: "bootstrapIcons", pack: "bootstrap-icons", version: dependencies["bootstrap-icons"].substring(1)}
	];

	for (lib in versions) {
		replaceInFile("src/bootstrap/Version.hx", new EReg('${lib.field} = "\\d+(\\.\\d+){2}"', ""), '${lib.field} = "${lib.version}"');
		for (file in ["README.md", "docs/README.md"]) replaceInFile(file, new EReg('${lib.pack}/v\\d+(\\.\\d+){2}', ""), '${lib.pack}/v${lib.version}');
	}
}
