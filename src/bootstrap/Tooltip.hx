package bootstrap;

import haxe.DynamicAccess;
import haxe.extern.EitherType;
import js.html.Element;
import js.html.Node;

/** Represents a tooltip. **/
@:native("bootstrap.Tooltip")
extern class Tooltip {

	/** Creates a new tooltip. **/
	function new(element: EitherType<Element, String>, ?options: TooltipOptions);

	/** Gets the tooltip instance associated with the specified DOM element. **/
	static function getInstance(element: Element): Tooltip;

	/** Removes the ability for an element's tooltip to be shown. **/
	function disable(): Void;

	/** Hides and destroys an element's tooltip. **/
	function dispose(): Void;

	/** Gives an element's tooltip the ability to be shown. **/
	function enable(): Void;

	/** Hides an element's tooltip. **/
	function hide(): Void;

	/** Reveals an element's tooltip. **/
	function show(): Void;

	/** Toggles an element's tooltip. **/
	function toggle(): Void;

	/** Toggles the ability for an element's tooltip to be shown or hidden. **/
	function toggleEnabled(): Void;

	/** Updates the position of an element's tooltip. **/
	function update(): Void;
}

/** Defines the delay for showing and hiding a tooltip. **/
typedef TooltipDelay = {

	/** The delay for hiding the tooltip. **/
	var hide: Int;

	/** The delay for showing the tooltip. **/
	var show: Int;
}

/** Specifies the placement of a tooltip. **/
enum abstract TooltipPlacement(String) to String {
	var Auto = "auto";
	var Bottom = "bottom";
	var Left = "left";
	var Right = "right";
	var Top = "top";
}

/** Defines the options of a `Tooltip` instance. **/
typedef TooltipOptions = {

	/** Object which contains allowed attributes and tags. **/
	var ?allowList: DynamicAccess<Array<EitherType<String, EReg>>>;

	/** Value indicating whether to apply a fade transition to the tooltip. **/
	var ?animation: Bool;

	/** Overflow constraint boundary of the tooltip. **/
	var ?boundary: EitherType<String, Element>;

	/** Appends the tooltip to a specific element. **/
	var ?container: EitherType<String, EitherType<Element, Bool>>;

	/** Adds classes to the tooltip when it is shown. **/
	var ?customClass: EitherType<String, () -> String>;

	/** Delay showing and hiding the tooltip. **/
	var ?delay: EitherType<Int, TooltipDelay>;

	/** Allows to specify which position [Popper](https://popper.js.org) will use on fallback. **/
	var ?fallbackPlacement: Null<Array<String>>;

	/** Value indicating whether to allow HTML in the tooltip. **/
	var ?html: Bool;

	/** The offset of the tooltip relative to its target. **/
	var ?offset: EitherType<EitherType<Array<Int>, String>, ({}, Node) -> Array<Int>>;

	/** How to position the tooltip. **/
	var ?placement: EitherType<TooltipPlacement, (Node, Node) -> TooltipPlacement>;

	/** Changes the default [Popper](https://popper.js.org) configuration. **/
	var ?popperConfig: Null<{}>;

	/** Value indicating whether to enable the sanitization. **/
	var ?sanitize: Bool;

	/** A custom sanitize function. **/
	var ?sanitizeFn: Null<String -> String>;

	/** If a selector is provided, tooltip objects will be delegated to the specified targets. **/
	var ?selector: EitherType<Bool, String>;

	/** Base HTML to use when creating the tooltip. **/
	var ?template: String;

	/** Default title value if `title` attribute isn't present. **/
	var ?title: EitherType<String, EitherType<Element, () -> String>>;

	/** How the tooltip is triggered. **/
	var ?trigger: String;
}

/** Specifies how a tooltip is triggered. **/
enum abstract TooltipTrigger(String) to String {
	var Click = "click";
	var Focus = "focus";
	var Hover = "hover";
	var Manual = "manual";
}
