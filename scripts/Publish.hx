//! --class-path src --library tink_cli
import Sys.*;
import Tools.compress;
import bootstrap.cli.Version.*;

/** Runs the script. **/
function main() {
	command("lix Dist");
	compress(["CHANGELOG.md", "LICENSE.md", "README.md", "haxelib.json", "lib", "run.n", "src"], "var/haxelib.zip");
	command("haxelib submit var/haxelib.zip");

	final tag = 'v${getPackageVersion())}';
	for (action in ["tag", "push origin"]) command('git $action $tag');
}
