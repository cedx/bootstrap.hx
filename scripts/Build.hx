import Sys.*;
import sys.FileSystem.*;
import sys.io.File.*;

/** Runs the script. **/
function main() {
	command("haxe run.hxml");

	if (exists("lib")) Tools.removeDirectory("lib");
	for (source => destination in [
		"node_modules/bootstrap/dist/css" => "lib/css",
		"node_modules/bootstrap/dist/js" => "lib/js",
		"node_modules/bootstrap/scss" => "lib/scss",
		"node_modules/bootstrap-icons/icons" => "lib/icons",
		"node_modules/bootstrap-icons/font/fonts" => "lib/fonts"
	]) Tools.copyDirectory(source, destination, ~/\.map$/i);

	for (extension in ["css", "scss"]) {
		copy('node_modules/bootstrap-icons/font/bootstrap-icons.$extension', 'lib/$extension/bootstrap-icons.$extension');
		Tools.replaceInFile('lib/$extension/bootstrap-icons.$extension', ~/\.\/fonts\//g, "../fonts/");
	}
}
