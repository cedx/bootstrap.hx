package js.sass;

import js.node.ChildProcess;
import js.node.Url;
import js.node.url.URL;
using StringTools;
using haxe.io.Path;

/** Loads `bootstrap:` URLs according to the location of the `bootstrap_bundle` package. **/
class BootstrapImporter {

	/** The file URL of the `bootstrap_bundle` package. **/
	final pkgUrl: URL;

	/** Creates a new Bootstrap importer. **/
	public function new() {
		final path = ChildProcess.execFileSync("lix", ["run", "bootstrap_bundle", "libpath"], {encoding: "utf8", shell: true});
		pkgUrl = Url.pathToFileURL(Path.join([path.rtrim(), "scss"]).addTrailingSlash());
	}

	/** Partially resolves a load (such as `@use` or `@import`) to a file on disk. **/
	public function findFileUrl(url: String): Null<URL>
		return url.startsWith("bootstrap:") ? new URL(url.substr(10), pkgUrl) : null;
}

/** Loads `pkg:` URLs from the `node_modules` folder according to the standard Node.js resolution algorithm. **/
@:jsRequire("sass-embedded", "NodePackageImporter")
extern class NodePackageImporter {

	/** Creates a new Node.js package importer. **/
	function new(?entryPointDirectory: String);
}
