package js.sass;

/** The deprecation types currently used by Sass. **/
enum abstract Deprecations(String) from String to String {
	var ColorFunctions = "color-functions";
	var GlobalBuiltin = "global-builtin";
	var Import = "import";
	var MixedDeclarations = "mixed-decls";
}
