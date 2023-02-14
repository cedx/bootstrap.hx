package bootstrap.cli;

/** Command line interface of Bootstrap Bundle for Haxe. **/
final class Program {

	/** Copy the Bootstrap assets to a given directory. **/
	@:command
	public final copy = new CopyCommand();

	/** Display this help. **/
	public var help = false;

	/** Print the path to the Bootstrap assets. **/
	@:command
	public final libpath = new LibpathCommand();

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
