package js.bootstrap;

import haxe.extern.EitherType;
import js.bootstrap.Tooltip.TooltipOptions;
import js.html.Element;

/** Represents a popover. **/
@:native("bootstrap.Popover")
extern class Popover {

	/** Creates a new popover. **/
	function new(element: EitherType<Element, String>, ?options: PopoverOptions);

	/** Gets the popover instance associated with the specified DOM element. **/
	static function getInstance(element: Element): Popover;

	/** Removes the ability for an element's popover to be shown. **/
	function disable(): Void;

	/** Hides and destroys an element's popover. **/
	function dispose(): Void;

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

/** Defines the options of a `Popover` instance. **/
typedef PopoverOptions = TooltipOptions & {

	/** Default content value if `data-bs-content` attribute isn't present. **/
	var ?content: EitherType<String, EitherType<Element, () -> String>>;
}
