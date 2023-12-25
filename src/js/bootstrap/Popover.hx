package js.bootstrap;

import haxe.extern.EitherType;
import js.bootstrap.Tooltip.TooltipDelay;
import js.bootstrap.Tooltip.TooltipPlacement;
import js.bootstrap.Tooltip.TooltipOptions;
import js.bootstrap.Tooltip.TooltipTrigger;
import js.html.Element;

/** A popover. **/
@:native("bootstrap.Popover")
extern class Popover extends Tooltip {

	/** The default options. **/
	static final Default: PopoverOptions;

	/** The component name. **/
	static final NAME: String;

	/** Creates a new popover. **/
	function new(element: EitherType<Element, String>, ?options: PopoverOptions);

	/** Gets the popover instance associated with the specified DOM element. **/
	static function getInstance(element: EitherType<Element, String>): Null<Popover>;

	/** Gets the popover instance associated with the specified DOM element or creates a new one in case it wasn't initialized. **/
	static function getOrCreateInstance(element: EitherType<Element, String>, ?options: PopoverOptions): Popover;
}

/** Defines the delay for showing and hiding a popover. **/
typedef PopoverDelay = TooltipDelay;

/** Enumeration of events emitted by popovers. **/
enum abstract PopoverEvents(String) to String {

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
	var ?content: EitherType<Element, EitherType<String, EitherType<() -> Element, () -> String>>>;
}

/** Specifies how a popover is triggered. **/
typedef PopoverTrigger = TooltipTrigger;
