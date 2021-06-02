package bootstrap.cli;

import tink.Cli;
import tink.cli.Rest;

/** TODO. **/
class CopyCommand {

	/** Copy only CSS files. **/
	public var css = false;

	/** Copy only font files. **/
	public var fonts = false;

	/** Output usage information. **/
	public var help = false;

	/** Copy only icon files. **/
	public var icons = false;

	/** Copy only JavaScript files. **/
	public var js = false;

	/** Copy only Sass files. **/
	public var scss = false;

	/** <directory> : The path to the output directory. **/
	@:defaultCommand
	public function run(rest: Rest<String>): Promise<Noise> {
		return Noise;
	}
}
