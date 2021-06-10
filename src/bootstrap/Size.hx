package bootstrap;

/** Defines the size of a component. **/
enum abstract Size(String) from String {

	/** A default size. **/
	var Default = "";

	/** A large size. **/
	var Large = "lg";

	/** A small size. **/
	var Small = "sm";
}
