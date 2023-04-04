//! --class-path src
import bootstrap.Version;

/** Publishes the package. **/
function main() {
	Sys.command("lix Dist");
	Tools.compress(["CHANGELOG.md", "LICENSE.md", "README.md", "haxelib.json", "lib", "run.n", "src"], "var/haxelib.zip");
	Sys.command("haxelib submit var/haxelib.zip");
	for (action in ["tag", "push origin"]) Sys.command('git $action v${Version.packageVersion}');
}
