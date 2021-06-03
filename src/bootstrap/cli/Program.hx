package bootstrap.cli;

/** Command line interface of Bootstrap Bundle for Haxe. **/
class Program {

	/** Output usage information. **/
	public var help = false;

	/** Print the path to the Bootstrap assets. **/
	@:command
	public final libpath = new LibpathCommand();

	/** Output the version number. **/
	public var version = false;

	/** Creates a new program. **/
	public function new() {}

	/** Application entry point. **/
	public static function main() Cli.process(Sys.args(), new Program()).handle(Cli.exit);

	// Runs this command.
	@:defaultCommand
	public function run() {
		Sys.println(version ? Version.getPackageVersion() : Cli.getDoc(this));
		return Promise.NOISE;
	}
}
