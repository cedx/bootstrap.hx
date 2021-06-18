import Tools.copyDirectory;
import Tools.removeDirectory;
import Tools.replaceInFile;
import sys.FileSystem.*;
import sys.io.File.*;

/** Runs the script. **/
function main() {
	if (exists("lib")) removeDirectory("lib");
	for (source => destination in [
		"node_modules/bootstrap/dist/css" => "lib/css",
		"node_modules/bootstrap/dist/js" => "lib/js",
		"node_modules/bootstrap/scss" => "lib/scss",
		"node_modules/bootstrap-icons/icons" => "lib/icons",
		"node_modules/bootstrap-icons/font/fonts" => "lib/fonts"
	]) copyDirectory(source, destination, ~/\.map$/i);

	copy("node_modules/bootstrap-icons/font/bootstrap-icons.css", "lib/css/bootstrap-icons.css");
	replaceInFile("lib/css/bootstrap-icons.css", ~/\.\/fonts\//g, "../fonts/");
}
