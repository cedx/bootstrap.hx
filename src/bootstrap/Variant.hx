package bootstrap;

/** Defines a variant, also known as contextual modifier. **/
enum abstract Variant(String) from String {

	/** A danger. **/
	var Danger = "danger";

	/** A dark variant. **/
	var Dark = "dark";

	/** An information. **/
	var Info = "info";

	/** A light variant. **/
	var Light = "light";

	/** A primary variant. **/
	var Primary = "primary";

	/** A secondary variant. **/
	var Secondary = "secondary";

	/** A success. **/
	var Success = "success";

	/** A warning. **/
	var Warning = "warning";
}
