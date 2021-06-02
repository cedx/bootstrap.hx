package bootstrap.cli;

import tink.Cli;
import tink.cli.Rest;

using haxe.io.Path;

/** TODO. **/
class Program {

	/** Output usage information. **/
	public var help = false;

	/** Output the path to the Bootstrap assets. **/
	@:alias("p")
	@:flag("lib-path")
	public var libPath = false;

	/** Output the version number. **/
	public var version = false;

	/** Creates a new program. **/
	public function new() {}

	/** Application entry point. **/
	public static function main() Cli.process(Sys.args(), new Program()).handle(Cli.exit);

	// Runs this command.
	@:defaultCommand
	public function run(rest: Rest<String>): Promise<Noise> {
		if (help || version) {
			Sys.println(help ? Cli.getDoc(this) : Version.getPackageVersion());
			return Noise;
		}

		if (Sys.getEnv("HAXELIB_RUN") != "1" || rest.length > 1) {
			// TODO
			return new Error(BadRequest, "TODO");
		}

		Sys.println(Path.join([Sys.getCwd(), "lib"]));
		return Noise;
	}
}
