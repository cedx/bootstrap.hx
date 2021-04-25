package bootstrap;

import haxe.extern.EitherType;
import js.html.Element;

/** Represents a collapsible element. **/
@:native("bootstrap.Collapse")
extern class Collapse {

	/** Creates a new collapsible element. **/
	function new(element: EitherType<Element, String>, ?options: CollapseOptions);

	/** Gets the collapse instance associated with the specified DOM element. **/
	static function getInstance(element: Element): Collapse;

	/** Destroys an element's collapse. **/
	function dispose(): Void;

	/** Hides a collapsible element. **/
	function hide(): Void;

	/** Shows a collapsible element. **/
	function show(): Void;

	/** Toggles a collapsible element to shown or hidden. **/
	function toggle(): Void;
}

/** Defines the options of a `Collapse` instance. **/
typedef CollapseOptions = {

	/** If `parent` is provided, then all collapsible elements under the specified parent will be closed when the collapsible item is shown. **/
	var ?parent: EitherType<String, EitherType<Element, Bool>>;

	/** Value indicating whether to toggle the collapsible element on invocation. **/
	var ?toggle: Bool;
}
