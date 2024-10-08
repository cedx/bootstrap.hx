package js.bootstrap;

import haxe.extern.EitherType;
import js.bootstrap.Popper.PopperOptions;
import js.html.Element;
import js.html.Node;

/** A tooltip. **/
@:native("bootstrap.Tooltip")
extern class Tooltip extends BaseComponent {

	/** The default options. **/
	@:native("Default") static final defaults: TooltipOptions;

	/** The component name. **/
	@:native("NAME") static final name: String;

	/** Creates a new tooltip. **/
	function new(element: EitherType<Element, String>, ?options: TooltipOptions);

	/** Gets the tooltip instance associated with the specified DOM element. **/
	static function getInstance(element: EitherType<Element, String>): Null<Tooltip>;

	/** Gets the tooltip instance associated with the specified DOM element or creates a new one in case it wasn't initialized. **/
	static function getOrCreateInstance(element: EitherType<Element, String>, ?options: TooltipOptions): Tooltip;

	/** Removes the ability for an element's tooltip to be shown. **/
	function disable(): Void;

	/** Gives an element's tooltip the ability to be shown. **/
	function enable(): Void;

	/** Hides an element's tooltip. **/
	function hide(): Void;

	/** Changes the tooltip's content after its initialization. **/
	function setContent(value: Dynamic<Any>): Void;

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

/** Enumeration of events emitted by tooltips. **/
enum abstract TooltipEvents(String) to String {

	/** Fired immediately when the `Tooltip.hide()` method is called. **/
	var Hide = "hide.bs.tooltip";

	/** Fired when the tooltip has been hidden from the user. **/
	var Hidden = "hidden.bs.tooltip";

	/** Fired after the `Show` event when the tooltip template has been added to the DOM. **/
	var Inserted = "inserted.bs.tooltip";

	/** Fired immediately when the `Tooltip.show()` method is called. **/
	var Show = "show.bs.tooltip";

	/** Fired when the tooltip has been made visible to the user. **/
	var Shown = "shown.bs.tooltip";
}

/** Specifies the placement of a tooltip. **/
enum abstract TooltipPlacement(String) to String {

	/** The tooltip is automatically placed. **/
	var Auto = "auto";

	/** The tooltip is placed at the bottom. **/
	var Bottom = "bottom";

	/** The tooltip is placed at the left. **/
	var Left = "left";

	/** The tooltip is placed at the right. **/
	var Right = "right";

	/** The tooltip is placed at the top. **/
	var Top = "top";
}

/** Defines the options of a `Tooltip` instance. **/
typedef TooltipOptions = PopperOptions & {

	/** Object which contains allowed attributes and tags. **/
	var ?allowList: Dynamic<Array<EitherType<EReg, String>>>;

	/** Value indicating whether to apply a fade transition to the tooltip. **/
	var ?animation: Bool;

	/** Appends the tooltip to a specific element. **/
	var ?container: EitherType<Bool, EitherType<Element, String>>;

	/** Adds classes to the tooltip when it is shown. **/
	var ?customClass: EitherType<String, () -> String>;

	/** Delay showing and hiding the tooltip. **/
	var ?delay: EitherType<Int, TooltipDelay>;

	/** Allows to specify which position [Popper](https://popper.js.org) will use on fallback. **/
	var ?fallbackPlacement: Array<String>;

	/** Value indicating whether to allow HTML in the tooltip. **/
	var ?html: Bool;

	/** How to position the tooltip. **/
	var ?placement: EitherType<TooltipPlacement, (Node, Node) -> TooltipPlacement>;

	/** Value indicating whether to enable the sanitization. **/
	var ?sanitize: Bool;

	/** A custom sanitize function. **/
	var ?sanitizeFn: String -> String;

	/** If a selector is provided, tooltip objects will be delegated to the specified targets. **/
	var ?selector: EitherType<Bool, String>;

	/** Base HTML to use when creating the tooltip. **/
	var ?template: String;

	/** Default title value if `title` attribute isn't present. **/
	var ?title: EitherType<Element, EitherType<String, EitherType<() -> Element, () -> String>>>;

	/** How the tooltip is triggered. **/
	var ?trigger: EitherType<TooltipTrigger, String>;
}

/** Specifies how a tooltip is triggered. **/
enum abstract TooltipTrigger(String) to String {

	/** The tooltip is triggered by a click. **/
	var Click = "click";

	/** The tooltip is triggered on focus. **/
	var Focus = "focus";

	/** The tooltip is triggered on hover. **/
	var Hover = "hover";

	/** The tooltip is manually triggered. **/
	var Manual = "manual";
}
