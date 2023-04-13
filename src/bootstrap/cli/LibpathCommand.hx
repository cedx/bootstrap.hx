package bootstrap.cli;

using StringTools;
using haxe.io.Path;

/**
	Print the path to the Bootstrap assets.

	> bootstrap_bundle libpath [flags]
**/
class LibpathCommand {

	/** Display this help. **/
	public var help = false;

	/** Creates a new `libpath` command. **/
	public function new() {}

	// Runs this command.
	@:defaultCommand
	public function run() {
		final path = Path.join([Sys.programPath().directory(), "lib"]);
		Sys.println(help ? Cli.getDoc(this) : path.replace("/", Sys.systemName() == "Windows" ? "\\" : "/"));
		return Promise.NOISE;
	}
}
