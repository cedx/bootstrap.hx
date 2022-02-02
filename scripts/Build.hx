import sys.FileSystem;
import sys.io.File;

/** Runs the script. **/
function main() {
	Sys.command("haxe run.hxml");
	if (FileSystem.exists("lib")) Tools.removeDirectory("lib");

	final mapping = [
		"node_modules/bootstrap/dist/css" => "lib/css",
		"node_modules/bootstrap/dist/js" => "lib/js",
		"node_modules/bootstrap/scss" => "lib/scss",
		"node_modules/bootstrap-icons/icons" => "lib/icons",
		"node_modules/bootstrap-icons/font/fonts" => "lib/fonts"
	];

	for (source => destination in mapping) Tools.copyDirectory(source, destination, ~/\.map$/i);
	for (extension in ["css", "scss"]) {
		File.copy('node_modules/bootstrap-icons/font/bootstrap-icons.$extension', 'lib/$extension/bootstrap-icons.$extension');
		Tools.replaceInFile('lib/$extension/bootstrap-icons.$extension', ~/\.\/fonts\//g, "../fonts/");
	}
}
