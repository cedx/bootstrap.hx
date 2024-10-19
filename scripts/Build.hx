import sys.FileSystem;
import sys.io.File;
using haxe.io.Path;

/** Builds the project. **/
function main() {
	Sys.command("haxe run.hxml");
	if (FileSystem.exists("lib")) removeDirectory("lib");

	final sources = [
		"bootstrap/dist/css",
		"bootstrap/dist/js",
		"bootstrap/scss",
		"bootstrap-icons/icons",
		"bootstrap-icons/font/fonts"
	];

	for (source in sources) copyDirectory('node_modules/$source', 'lib/${source.withoutDirectory()}', ~/\.map$/i);
	for (directory in ["css", "js"])
		for (file in FileSystem.readDirectory('lib/$directory')) replaceInFile('lib/$directory/$file', ~/\s*(\/\/|\/\*)# sourceMappingURL=.*$/s, "");

	for (extension in ["css", "scss"]) {
		final output = 'lib/$extension/bootstrap-icons.$extension';
		File.copy('node_modules/bootstrap-icons/font/bootstrap-icons.$extension', output);
		replaceInFile(output, ~/\.\/fonts/g, "../fonts");
	}
}

/** Recursively deletes all files in the specified `directory`. **/
private function cleanDirectory(directory: String) for (entry in FileSystem.readDirectory(directory).filter(entry -> entry != ".gitkeep")) {
	final path = Path.join([directory, entry]);
	FileSystem.isDirectory(path) ? removeDirectory(path) : FileSystem.deleteFile(path);
}

/** Recursively copies all files in the specified `source` directory to a given `destination` directory. **/
function copyDirectory(source: String, destination: String, ?exclude: EReg) for (entry in FileSystem.readDirectory(source)) {
	final input = Path.join([source, entry]);
	final output = Path.join([destination, entry]);
	if (FileSystem.isDirectory(input)) copyDirectory(input, output, exclude);
	else if (exclude == null || !exclude.match(input.withoutDirectory())) {
		FileSystem.createDirectory(output.directory());
		File.copy(input, output);
	}
}

/** Recursively deletes the specified `directory`. **/
private function removeDirectory(directory: String) {
	cleanDirectory(directory);
	FileSystem.deleteDirectory(directory);
}

/** Replaces in the specified `file` the substring which the `pattern` matches with the given `replacement`. **/
private function replaceInFile(file: String, pattern: EReg, replacement: String)
	File.saveContent(file, pattern.replace(File.getContent(file), replacement));
