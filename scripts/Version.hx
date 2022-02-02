//! --class-path src --library tink_cli
import bootstrap.cli.Version;
import haxe.DynamicAccess;
import haxe.Json;
import sys.io.File;

/** Runs the script. **/
function main() {
	Tools.replaceInFile("package.json", ~/"version": "\d+(\.\d+){2}"/, '"version": "${Version.packageVersion}"');

	final dependencies: DynamicAccess<String> = Json.parse(File.getContent("package.json")).dependencies;
	final versions = [
		{field: "bootstrap", pack: "bootstrap", version: dependencies["bootstrap"].substring(1)},
		{field: "bootstrapIcons", pack: "bootstrap-icons", version: dependencies["bootstrap-icons"].substring(1)}
	];

	for (lib in versions) {
		Tools.replaceInFile("README.md", new EReg('${lib.pack}/v\\d+(\\.\\d+){2}', ""), '${lib.pack}/v${lib.version}');
		Tools.replaceInFile("src/js/bootstrap/Version.hx", new EReg('${lib.field} = "\\d+(\\.\\d+){2}"', ""), '${lib.field} = "${lib.version}"');
	}
}
