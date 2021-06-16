package bootstrap;

/** Defines the size of a component. **/
enum abstract Size(String) from String to String {

	/** An extra small size. **/
	var ExtraSmall = "xs";

	/** A small size. **/
	var Small = "sm";

	/** A medium size. **/
	var Medium = "md";

	/** A large size. **/
	var Large = "lg";

	/** An extra large size. **/
	var ExtraLarge = "xl";

	/** An extra extra large size. **/
	var ExtraExtraLarge = "xxl";
}
