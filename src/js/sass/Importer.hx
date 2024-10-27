package js.sass;

import js.node.url.URL;

/** Contextual information passed to `FileImporter.findFileUrl()`. **/
typedef CanonicalizeContext = {

	/** The canonical URL of the file that contains the load, if that information is available. **/
	var containingUrl: Null<URL>;

	/** Value indicating whether this is being invoked because of an `@import` rule, as opposed to a `@use` or `@forward` rule. **/
	var fromImport: Bool;
}

/** An importer that redirects all loads to existing files on disk. **/
typedef FileImporter = {

	/** Partially resolves a load (such as `@use` or `@import`) to a file on disk. **/
	function findFileUrl(url: String): Null<URL>;
}

/** Loads `pkg:` URLs from the `node_modules` folder according to the Node.js resolution algorithm. **/
@:jsRequire(#if sass_embedded "sass-embedded" #else "sass" #end, "NodePackageImporter")
extern class NodePackageImporter {

	/** Creates a new Node.js package importer. **/
	function new(?entryPointDirectory: String);
}
