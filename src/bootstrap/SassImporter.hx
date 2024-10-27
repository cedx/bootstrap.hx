package bootstrap;

import js.node.ChildProcess;
import js.node.Url;
import js.node.url.URL;
using StringTools;
using haxe.io.Path;

/** Loads `bootstrap:` URLs according to the location of the `bootstrap_bundle` package. **/
class SassImporter {

	/** The file URL of the `bootstrap_bundle` package. **/
	final pkgUrl: URL;

	/** Creates a new Sass importer. **/
	public function new(?entryPointDirectory: String) {
		entryPointDirectory ??= ChildProcess.execFileSync("lix", ["run", "bootstrap_bundle", "libpath"], {encoding: "utf8", shell: true}).rtrim();
		pkgUrl = Url.pathToFileURL(Path.join([entryPointDirectory, "scss"]).addTrailingSlash());
	}

	/** Partially resolves a load (such as `@use` or `@import`) to a file on disk. **/
	public function findFileUrl(url: String): Null<URL>
		return url.startsWith("bootstrap:") ? new URL(url.substr(10), pkgUrl) : null;
}
