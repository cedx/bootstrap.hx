package js.bootstrap;

import haxe.extern.EitherType;
import js.html.Element;

/** Automatically updates navigation or list group components based on scroll position. **/
@:native("bootstrap.Scrollspy")
extern class Scrollspy extends BaseComponent {

	/** Creates a new scrollspy. **/
	function new(element: EitherType<Element, String>, ?options: ScrollspyOptions);

	/** Gets the scrollspy instance associated with the specified DOM element or creates a new one in case it wasn't initialised. **/
	static function getOrCreateInstance(element: EitherType<Element, String>): Scrollspy;

	/** Gets the scrollspy instance associated with the specified DOM element. **/
	static function getInstance(element: EitherType<Element, String>): Scrollspy;

	/** Refreshes this component, after adding or removing of elements from the DOM. **/
	function refresh(): Void;
}

/** Enumeration of events emitted by scrollspies. **/
enum abstract ScrollspyEvent(String) to String {

	/** Fired on the scroll element whenever a new item becomes activated by the scrollspy. **/
	var Activate = "activate.bs.scrollspy";
}

/** Specifies how the scrollspy finds which section the spied element is in. **/
enum abstract ScrollspyMethod(String) to String {

	/** Chooses the best method to get scroll coordinates. **/
	var Auto = "auto";

	/** Uses the `Element.getBoundingClientRect()` method to get scroll coordinates. **/
	var Offset = "offset";

	/** Uses the `Element.offsetTop` and `Element.offsetLeft` properties to get scroll coordinates. **/
	var Position = "position";
}

/** Defines the options of a `Scrollspy` instance. **/
typedef ScrollspyOptions = {

	/** The method that the scrollspy uses to find which section the spied element is in. **/
	var ?method: ScrollspyMethod;

	/** Pixels to offset from top when calculating position of scroll. **/
	var ?offset: Int;

	/** Specifies element to apply the scrollspy. **/
	var ?target: EitherType<Element, String>;
}
