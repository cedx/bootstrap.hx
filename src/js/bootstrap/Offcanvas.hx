package js.bootstrap;

import haxe.extern.EitherType;
import js.html.Element;

/** A sidebar component. **/
@:native("bootstrap.Offcanvas")
extern class Offcanvas extends BaseComponent {

	/** Creates a new offcanvas. **/
	function new(element: EitherType<Element, String>, ?options: OffcanvasOptions);

	/** Gets the offcanvas instance associated with the specified DOM element. **/
	static function getInstance(element: EitherType<Element, String>): Offcanvas;

	/** Gets the offcanvas instance associated with the specified DOM element or creates a new one in case it wasn't initialized. **/
	static function getOrCreateInstance(element: EitherType<Element, String>, ?options: OffcanvasOptions): Offcanvas;

	/** Hides an offcanvas element. **/
	function hide(): Void;

	/** Shows an offcanvas element. **/
	function show(): Void;

	/** Toggles an offcanvas element to shown or hidden. **/
	function toggle(): Void;
}

/** Enumeration of events emitted by offcanvas elements. **/
enum abstract OffcanvasEvents(String) to String {

	/** Fired immediately when the `Offcanvas.hide()` method is called. **/
	var Hide = "hide.bs.offcanvas";

	/** Fired when the offcanvas element has been hidden from the user. **/
	var Hidden = "hidden.bs.offcanvas";

	/** Fired immediately when the `Offcanvas.show()` method is called. **/
	var Show = "show.bs.offcanvas";

	/** Fired when the offcanvas element has been made visible to the user. **/
	var Shown = "shown.bs.offcanvas";
}

/** Defines the options of an `Offcanvas` instance. **/
typedef OffcanvasOptions = {

	/** Value indicating whether to apply a backdrop on body while the offcanvas is open. **/
	var ?backdrop: Bool;

	/** Value indicating whether to close the offcanvas when escape key is pressed. **/
	var ?keyboard: Bool;

	/** Value indicating whether to allow body scrolling while the offcanvas is open. **/
	var ?scroll: Bool;
}
