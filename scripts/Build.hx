import sys.FileSystem;
import sys.io.File;

/** Runs the script. **/
function main() {
	Sys.command("haxe", ["run.hxml"]);
	if (FileSystem.exists("lib")) Tools.removeDirectory("lib");

	final mapping = [
		"bootstrap/dist/css" => "css",
		"bootstrap/dist/js" => "js",
		"bootstrap/scss" => "scss",
		"bootstrap-icons/icons" => "icons",
		"bootstrap-icons/font/fonts" => "fonts"
	];

	for (source => destination in mapping) Tools.copyDirectory('node_modules/$source', 'lib/$destination');
	for (extension in ["css", "scss"]) {
		final output = 'lib/$extension/bootstrap-icons.$extension';
		File.copy('node_modules/bootstrap-icons/font/bootstrap-icons.$extension', output);
		Tools.replaceInFile(output, ~/\.\/fonts/g, "../fonts");
	}
}
