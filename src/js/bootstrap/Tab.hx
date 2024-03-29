package js.bootstrap;

import haxe.extern.EitherType;
import js.html.Element;

/** A tab. **/
@:native("bootstrap.Tab")
extern class Tab extends BaseComponent {

	/** The component name. **/
	@:native("NAME") static final name: String;

	/** Creates a new tab. **/
	function new(element: EitherType<Element, String>);

	/** Gets the tab instance associated with the specified DOM element. **/
	static function getInstance(element: EitherType<Element, String>): Null<Tab>;

	/** Gets the tab instance associated with the specified DOM element or creates a new one in case it wasn't initialized. **/
	static function getOrCreateInstance(element: EitherType<Element, String>): Tab;

	/** Selects the given tab and shows its associated pane. **/
	function show(): Void;
}

/** Enumeration of events emitted by tabs. **/
enum abstract TabEvents(String) to String {

	/** Fired when a new tab is to be shown (and thus the previous active tab is to be hidden). **/
	var Hide = "hide.bs.tab";

	/** Fired after a new tab is shown (and thus the previous active tab is hidden). **/
	var Hidden = "hidden.bs.tab";

	/** Fired on `Tab.show()`, but before the new tab has been shown. **/
	var Show = "show.bs.tab";

	/** Fired on `Tab.show()` after a tab has been shown. **/
	var Shown = "shown.bs.tab";
}
