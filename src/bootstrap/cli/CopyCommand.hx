package bootstrap.cli;

import sys.FileSystem;
import sys.io.File;

using haxe.io.Path;

/** Copy the Bootstrap assets to a given directory. **/
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

	/** Creates a new `copy` command. **/
	public function new() {}

	/** <directory> : The path to the output directory. **/
	@:defaultCommand
	public function run(rest: Rest<String>): Promise<Noise> {
		if (help) return { Sys.println(Cli.getDoc(this)); Noise; };

		final haxelibRun = Sys.getEnv("HAXELIB_RUN") == "1";
		final requiredArgs = 1;
		if (rest.length < requiredArgs || (haxelibRun && rest.length < requiredArgs + 1))
			return new Error(BadRequest, "You must provide the path of the output directory.");

		final sources = ["css", "fonts", "icons", "js", "scss"];
		var directories = sources.filter(source -> Reflect.field(this, source));
		if (directories.length == 0) directories = sources;

		final input = Path.join([Sys.getCwd(), "lib"]);
		final output = rest[0].isAbsolute() ? rest[0] : Path.join([haxelibRun ? rest[rest.length - 1] : Sys.getCwd(), rest[0]]);
		for (directory in directories) copyDirectory(Path.join([input, directory]), directories.length == 1 ? output : Path.join([output, directory]));
		return Noise;
	}

	/** Recursively copies all files in the specified `source` directory to a given `destination` directory. **/
	function copyDirectory(source: String, destination: String) for (entry in FileSystem.readDirectory(source)) {
		final input = Path.join([source, entry]);
		final output = Path.join([destination, entry]);
		if (FileSystem.isDirectory(input)) copyDirectory(input, output);
		else {
			FileSystem.createDirectory(output.directory());
			File.copy(input, output);
		}
	}
}
