package js.bootstrap;

import haxe.extern.EitherType;
import js.bootstrap.Popper.PopperOptions;
import js.html.DOMRect;
import js.html.Element;

/** Represents a toggleable, contextual overlay for displaying lists of links and more. **/
@:native("bootstrap.Dropdown")
extern class Dropdown extends BaseComponent {

	/** The component name. **/
	static final NAME: String;

	/** Creates a new dropdown element. **/
	function new(element: EitherType<Element, String>, ?options: DropdownOptions);

	/** Gets the dropdown instance associated with the specified DOM element. **/
	static function getInstance(element: EitherType<Element, String>): Null<Dropdown>;

	/** Gets the dropdown instance associated with the specified DOM element or creates a new one in case it wasn't initialized. **/
	static function getOrCreateInstance(element: EitherType<Element, String>, ?options: DropdownOptions): Dropdown;

	/** Hides the dropdown menu of a given navbar or tabbed navigation. **/
	function hide(): Void;

	/** Shows the dropdown menu of a given navbar or tabbed navigation. **/
	function show(): Void;

	/** Toggles the dropdown menu of a given navbar or tabbed navigation. **/
	function toggle(): Void;

	/** Updates the position of an element's dropdown. **/
	function update(): Void;
}

/** Specifies the auto close behavior of a dropdown. **/
enum abstract DropdownAutoClose(String) to String {

	/** The dropdown will be closed only by clicking inside the dropdown menu. **/
	var Inside = "inside";

	/** The dropdown will be closed only by clicking outside the dropdown menu. **/
	var Outside = "outside";
}

/** Specifies how a dropdown is positioned. **/
enum abstract DropdownDisplay(String) to String {

	/** The dropdown is dynamically positioned. **/
	var Dynamic = "dynamic";

	/** The dropdown is statically positioned. **/
	var Static = "static";
}

/** Enumeration of events emitted by dropdown elements. **/
enum abstract DropdownEvents(String) to String {

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
typedef DropdownOptions = PopperOptions & {

	/** Configure the auto close behavior of the dropdown. **/
	var ?autoClose: EitherType<Bool, DropdownAutoClose>;

	/** Value indicating how the dropdown is positioned. **/
	var ?display: DropdownDisplay;

	/** The reference element of the dropdown menu. **/
	var ?reference: EitherType<DropdownReference, EitherType<Element, {getBoundingClientRect: () -> DOMRect}>>;
}

/** Specifies the reference element of a dropdown menu. **/
enum abstract DropdownReference(String) to String {

	/** The reference element is the parent one. **/
	var Parent = "parent";

	/** The reference element is the toggle one. **/
	var Toggle = "toggle";
}
