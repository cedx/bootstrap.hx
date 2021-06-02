package bootstrap;

import haxe.extern.EitherType;
import js.html.Element;
import js.html.Node;

/** Represents a toggleable, contextual overlay for displaying lists of links and more. **/
@:native("bootstrap.Dropdown")
extern class Dropdown {

	/** Creates a new dropdown element. **/
	function new(element: EitherType<Element, String>, ?options: DropdownOptions);

	/** Gets the dropdown instance associated with the specified DOM element. **/
	static function getInstance(element: Element): Dropdown;

	/** Destroys an element's dropdown. **/
	function dispose(): Void;

	/** Hides the dropdown menu of a given navbar or tabbed navigation. **/
	function hide(): Void;

	/** Shows the dropdown menu of a given navbar or tabbed navigation. **/
	function show(): Void;

	/** Toggles the dropdown menu of a given navbar or tabbed navigation. **/
	function toggle(): Void;

	/** Updates the position of an element's dropdown. **/
	function update(): Void;
}

/** Specifies how a dropdown is positioned. **/
enum abstract DropdownDisplay(String) to String {
	var Dynamic = "dynamic";
	var Static = "static";
}

/** Defines the options of a `Dropdown` instance. **/
typedef DropdownOptions = {

	/** The overflow constraint boundary of the dropdown menu. **/
	var ?boundary: EitherType<String, Element>;

	/** Value indicating how the dropdown is positioned. **/
	var ?display: DropdownDisplay;

	/** The offset of the dropdown to its target. **/
	var ?offset: EitherType<EitherType<Array<Int>, String>, ({}, Node) -> Array<Int>>;

	/** The reference element of the dropdown menu. **/
	var ?reference: EitherType<String, Element>;
}
