package js.sass;

import haxe.extern.EitherType;
import js.sass.Importer.FileImporter;
import js.sass.Importer.NodePackageImporter;

/** Defines the options for a Sass compilation. **/
typedef Options = {

	/** The custom importers that control how Sass resolves loads from rules like `@use` and `@import`. **/
	var ?importers: Array<EitherType<FileImporter, NodePackageImporter>>;

	/** The paths in which to look for stylesheets loaded by rules like `@use` and `@import`. **/
	var ?loadPaths: Array<String>;

	/** A set of active deprecations to ignore. **/
	var ?silenceDeprecations: Array<Deprecations>;

	/** Value indicating whether to generate a source map. **/
	var ?sourceMap: Bool;

	/** Value indicating whether to include the sources in the generated source map. **/
	var ?sourceMapIncludeSources: Bool;

	/** The output style of the compiled CSS. **/
	var ?style: OutputStyle;
}

/** The possible output styles for the compiled CSS. **/
enum abstract OutputStyle(String) from String to String {

	/** Removes as many extra characters as possible, and writes the entire stylesheet on a single line. **/
	var Compressed = "compressed";

	/** Writes each selector and declaration on its own line. **/
	var Expanded = "expanded";
}
