package bootstrap.cli;

using StringTools;
using haxe.io.Path;

/** Print the path to the Bootstrap assets. **/
class LibpathCommand {

	/** Output usage information. **/
	public var help = false;

	/** Creates a new `libpath` command. **/
	public function new() {}

	// Runs this command.
	@:defaultCommand
	public function run() {
		Sys.println(help
			? Cli.getDoc(this)
			: Path.join([Sys.programPath().directory(), "lib"]).replace("/", Sys.systemName() == "Windows" ? "\\" : "/")
		);

		return Promise.NOISE;
	}
}
