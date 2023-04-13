package bootstrap.cli;

/**
	Command line interface of Bootstrap Bundle for Haxe.

	> bootstrap_bundle <subcommand>
**/
final class Program {

	/** Copy the Bootstrap assets to a given directory. **/
	@:command
	public final copy = new CopyCommand();

	/** Print the path to the Bootstrap assets. **/
	@:command
	public final libpath = new LibpathCommand();

	/** Display this help. **/
	public var help = false;

	/** Output the version number. **/
	public var version = false;

	/** Creates a new program. **/
	public function new() {}

	/** Application entry point. **/
	static function main() Cli.process(Sys.args(), new Program()).handle(Cli.exit);

	// Runs this command.
	@:defaultCommand
	public function run() {
		Sys.println(version ? Version.packageVersion : Cli.getDoc(this));
		return Promise.NOISE;
	}
}
