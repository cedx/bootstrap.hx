package js.bootstrap;

import haxe.extern.EitherType;
import js.bootstrap.Tooltip.TooltipDelay;
import js.bootstrap.Tooltip.TooltipPlacement;
import js.bootstrap.Tooltip.TooltipOptions;
import js.bootstrap.Tooltip.TooltipTrigger;
import js.html.Element;

/** A popover. **/
@:native("bootstrap.Popover")
extern class Popover extends BaseComponent {

	/** Creates a new popover. **/
	function new(element: EitherType<Element, String>, ?options: PopoverOptions);

	/** Gets the popover instance associated with the specified DOM element. **/
	static function getInstance(element: EitherType<Element, String>): Popover;

	/** Gets the popover instance associated with the specified DOM element or creates a new one in case it wasn't initialized. **/
	static function getOrCreateInstance(element: EitherType<Element, String>, ?options: PopoverOptions): Popover;

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

/** Defines the delay for showing and hiding a popover. **/
typedef PopoverDelay = TooltipDelay;

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

/** Specifies the placement of a popover. **/
typedef PopoverPlacement = TooltipPlacement;

/** Defines the options of a `Popover` instance. **/
typedef PopoverOptions = TooltipOptions & {

	/** Default content value if `data-bs-content` attribute isn't present. **/
	?content: EitherType<String, EitherType<Element, () -> String>>
}

/** Specifies how a popover is triggered. **/
typedef PopoverTrigger = TooltipTrigger;
