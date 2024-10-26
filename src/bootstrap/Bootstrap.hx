package bootstrap;

import sys.FileSystem;
import sys.io.File;
using StringTools;
using haxe.io.Path;

/** Provides access to the Bootstrap assets. **/
abstract class Bootstrap {

	/** The path to the Bootstrap assets. **/
	@:expose("assetPath")
	public static final assetPath = Path
		.join([Sys.programPath().directory(), #if js "../lib" #else "lib" #end])
		.replace("/", Sys.systemName() == "Windows" ? "\\" : "/");

	/** Copies the Bootstrap assets to a given `output` directory. **/
	@:expose("copyAssets")
	public static function copyAssets(output: String, ?options: CopyOptions) {
		options ??= {};
		final sources = ["css", "fonts", "icons", "js"];
		final directories = sources.filter(source -> Reflect.field(options, source) ?? false);
		for (directory in (directories.length > 0 ? directories : sources))
			copyDirectory(Path.join([assetPath, directory]), directories.length == 1 ? output : Path.join([output, directory]));
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

/** Defines the options of the `Bootstrap.copyAssets()` method. **/
typedef CopyOptions = {

	/** Value indicating whether to only copy the CSS files. **/
	var ?css: Bool;

	/** Value indicating whether to only copy the font files. **/
	var ?fonts: Bool;

	/** Value indicating whether to only copy the icon files. **/
	var ?icons: Bool;

	/** Value indicating whether to only copy the JavaScript files. **/
	var ?js: Bool;
}
