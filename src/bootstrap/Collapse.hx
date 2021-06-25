package bootstrap;

import haxe.extern.EitherType;
import js.html.Element;

/** A collapsible element. **/
@:native("bootstrap.Collapse")
extern class Collapse extends BaseComponent {

	/** Creates a new collapsible element. **/
	function new(element: EitherType<Element, String>, ?options: CollapseOptions);

	/** Gets the button instance associated with the specified DOM element or creates a new one in case it wasn't initialised. **/
	static function getOrCreateInstance(element: Element): Collapse;

	/** Gets the collapse instance associated with the specified DOM element. **/
	static function getInstance(element: Element): Collapse;

	/** Hides a collapsible element. **/
	function hide(): Void;

	/** Shows a collapsible element. **/
	function show(): Void;

	/** Toggles a collapsible element to shown or hidden. **/
	function toggle(): Void;
}

/** Enumeration of events emitted by collapsible elements. **/
enum abstract CollapseEvent(String) to String {

	/** Fired immediately when the `Collapse.hide()` method is called. **/
	var Hide = "hide.bs.collapse";

	/** Fired when the collapsible element has been hidden from the user. **/
	var Hidden = "hidden.bs.collapse";

	/** Fired immediately when the `Collapse.show()` method is called. **/
	var Show = "show.bs.collapse";

	/** Fired when the collapsible element has been made visible to the user. **/
	var Shown = "shown.bs.collapse";
}

/** Defines the options of a `Collapse` instance. **/
typedef CollapseOptions = {

	/** If `parent` is provided, then all collapsible elements under the specified parent will be closed when the collapsible item is shown. **/
	var ?parent: EitherType<String, EitherType<Element, Bool>>;

	/** Value indicating whether to toggle the collapsible element on invocation. **/
	var ?toggle: Bool;
}
