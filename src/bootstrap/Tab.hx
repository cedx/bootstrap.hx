package bootstrap;

import haxe.extern.EitherType;
import js.html.Element;

/** Represents a tab. **/
@:native("bootstrap.Tab")
extern class Tab {

	/** Creates a new tab. **/
	function new(element: EitherType<Element, String>);

	/** Gets the tab instance associated with the specified DOM element. **/
	static function getInstance(element: Element): Tab;

	/** Destroys an element's tab. **/
	function dispose(): Void;

	/** Selects the given tab and shows its associated pane. **/
	function show(): Void;
}
