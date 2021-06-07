package bootstrap;

import haxe.extern.EitherType;
import bootstrap.Tooltip.TooltipOptions;
import js.html.Element;

/** Represents a popover. **/
@:native("bootstrap.Popover")
extern class Popover extends BaseComponent {

	/** Creates a new popover. **/
	function new(element: EitherType<Element, String>, ?options: PopoverOptions);

	/** Gets the popover instance associated with the specified DOM element. **/
	static function getInstance(element: Element): Popover;

	/** Removes the ability for an element's popover to be shown. **/
	function disable(): Void;

	/** Gives an element's popover the ability to be shown. **/
	function enable(): Void;

	/** Hides an element's popover. **/
	function hide(): Void;

	/** Reveals an element's popover. **/
	function show(): Void;

	/** Toggles an element's popover. **/
	function toggle(): Void;

	/** Toggles the ability for an element's popover to be shown or hidden. **/
	function toggleEnabled(): Void;

	/** Updates the position of an element's popover. **/
	function update(): Void;
}

/** Enumeration of events emitted by popovers. **/
enum abstract PopoverEvent(String) to String {

	/** Fired immediately when the `Popover.hide()` method is called. **/
	var Hide = "hide.bs.popover";

	/** Fired when the popover has been hidden from the user. **/
	var Hidden = "hidden.bs.popover";

	/** Fired after the `Show` event when the popover template has been added to the DOM. **/
	var Inserted = "inserted.bs.popover";

	/** Fired immediately when the `Popover.show()` method is called. **/
	var Show = "show.bs.popover";

	/** Fired when the popover has been made visible to the user. **/
	var Shown = "shown.bs.popover";
}

/** Defines the options of a `Popover` instance. **/
typedef PopoverOptions = TooltipOptions & {

	/** Default content value if `data-bs-content` attribute isn't present. **/
	var ?content: EitherType<String, EitherType<Element, () -> String>>;
}
