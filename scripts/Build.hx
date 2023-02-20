import sys.FileSystem;
import sys.io.File;
using haxe.io.Path;

/** Builds the project. **/
function main() {
	Sys.command("haxe run.hxml");
	if (FileSystem.exists("lib")) Tools.removeDirectory("lib");

	final sources = [
		"bootstrap/dist/css",
		"bootstrap/dist/js",
		"bootstrap/scss",
		"bootstrap-icons/icons",
		"bootstrap-icons/font/fonts"
	];

	for (source in sources) Tools.copyDirectory('node_modules/$source', 'lib/${source.withoutDirectory()}', ~/\.map$/i);
	for (directory in ["css", "js"])
		for (file in FileSystem.readDirectory('lib/$directory')) Tools.replaceInFile('lib/$directory/$file', ~/\s*(\/\/|\/\*)# sourceMappingURL=.*$/s, "");

	for (extension in ["css", "scss"]) {
		final output = 'lib/$extension/bootstrap-icons.$extension';
		File.copy('node_modules/bootstrap-icons/font/bootstrap-icons.$extension', output);
		Tools.replaceInFile(output, ~/\.\/fonts/g, "../fonts");
	}
}
