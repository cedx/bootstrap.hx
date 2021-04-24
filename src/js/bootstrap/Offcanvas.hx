package js.bootstrap;

import haxe.extern.EitherType;
import js.html.Element;

/** Represents a sidebar component. **/
@:native("bootstrap.Offcanvas")
extern class Offcanvas {

	/** Creates a new offcanvas. **/
	function new(element: EitherType<Element, String>, ?options: OffcanvasOptions);

	/** Gets the offcanvas instance associated with the specified DOM element. **/
	static function getInstance(element: Element): Offcanvas;

	/** Hides an offcanvas element. **/
	function hide(): Void;

	/** Shows an offcanvas element. **/
	function show(): Void;

	/** Toggles an offcanvas element to shown or hidden. **/
	function toggle(): Void;
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
