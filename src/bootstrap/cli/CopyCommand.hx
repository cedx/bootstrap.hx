package bootstrap.cli;

import sys.FileSystem;
import sys.io.File;
using haxe.io.Path;

/**
	Copy the Bootstrap assets to a given directory.

	> bootstrap_bundle copy [flags] <directory>
**/
class CopyCommand {

	/** Copy only CSS files. **/
	public var css = false;

	/** Copy only font files. **/
	public var fonts = false;

	/** Copy only icon files. **/
	public var icons = false;

	/** Copy only JavaScript files. **/
	public var js = false;

	/** Copy only Sass files. **/
	public var scss = false;

	/** Display this help. **/
	public var help = false;

	/** Creates a new `copy` command. **/
	public function new() {}

	/** directory : The path to the output directory. **/
	@:defaultCommand
	public function run(rest: Rest<String>): Promise<Noise> {
		if (help) {
			Sys.println(Cli.getDoc(this));
			return Noise;
		}

		final haxelibRun = Sys.getEnv("HAXELIB_RUN") == "1";
		final requiredArgs = haxelibRun ? 2 : 1;
		if (rest.length < requiredArgs) return new Error(BadRequest, "You must provide the path of the output directory.");

		final sources = ["css", "fonts", "icons", "js", "scss"];
		var directories = sources.filter(source -> Reflect.field(this, source));
		if (directories.length == 0) directories = sources;

		final output = rest[0].isAbsolute() ? rest.shift() : Path.join([haxelibRun ? rest.pop() : Sys.getCwd(), rest.shift()]);
		Bootstrap.copyAssets(output, {css: css, fonts: fonts, icons: icons, js: js, scss: scss});
		return Noise;
	}

	/** Recursively copies all files in the specified `source` directory to a given `destination` directory. **/
	static function copyDirectory(source: String, destination: String) for (entry in FileSystem.readDirectory(source)) {
		final input = Path.join([source, entry]);
		final output = Path.join([destination, entry]);
		if (FileSystem.isDirectory(input)) copyDirectory(input, output);
		else {
			FileSystem.createDirectory(output.directory());
			File.copy(input, output);
		}
	}
}
