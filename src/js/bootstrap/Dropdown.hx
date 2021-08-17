package js.bootstrap;

import haxe.extern.EitherType;
import js.html.Element;
import js.html.Node;

/** Represents a toggleable, contextual overlay for displaying lists of links and more. **/
@:native("bootstrap.Dropdown")
extern class Dropdown extends BaseComponent {

	/** Creates a new dropdown element. **/
	function new(element: EitherType<Element, String>, ?options: DropdownOptions);

	/** Gets the dropdown instance associated with the specified DOM element or creates a new one in case it wasn't initialised. **/
	static function getOrCreateInstance(element: EitherType<Element, String>): Dropdown;

	/** Gets the dropdown instance associated with the specified DOM element. **/
	static function getInstance(element: EitherType<Element, String>): Dropdown;

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

	/** The dropdown is dynamically positioned. **/
	var Dynamic = "dynamic";

	/** The dropdown is statically positioned. **/
	var Static = "static";
}

/** Enumeration of events emitted by dropdown elements. **/
enum abstract DropdownEvent(String) to String {

	/** Fired immediately when the `Dropdown.hide()` method is called. **/
	var Hide = "hide.bs.dropdown";

	/** Fired when the dropdown has been hidden from the user. **/
	var Hidden = "hidden.bs.dropdown";

	/** Fired immediately when the `Dropdown.show()` method is called. **/
	var Show = "show.bs.dropdown";

	/** Fired when the dropdown has been made visible to the user. **/
	var Shown = "shown.bs.dropdown";
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
