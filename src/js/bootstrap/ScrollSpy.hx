package js.bootstrap;

import haxe.extern.EitherType;
import js.html.Element;

/** Automatically updates navigation or list group components based on scroll position. **/
@:native("bootstrap.ScrollSpy")
extern class ScrollSpy extends BaseComponent {

	/** Creates a new scrollspy. **/
	function new(element: EitherType<Element, String>, ?options: ScrollSpyOptions);

	/** Gets the scrollspy instance associated with the specified DOM element. **/
	static function getInstance(element: EitherType<Element, String>): ScrollSpy;

	/** Gets the scrollspy instance associated with the specified DOM element or creates a new one in case it wasn't initialized. **/
	static function getOrCreateInstance(element: EitherType<Element, String>, ?options: ScrollSpyOptions): ScrollSpy;

	/** Refreshes this component, after adding or removing of elements from the DOM. **/
	function refresh(): Void;
}

/** Enumeration of events emitted by scrollspies. **/
enum abstract ScrollSpyEvent(String) to String {

	/** Fired on the scroll element whenever a new item becomes activated by the scrollspy. **/
	var Activate = "activate.bs.scrollspy";
}

/** Specifies how the scrollspy finds which section the spied element is in. **/
enum abstract ScrollSpyMethod(String) to String {

	/** Chooses the best method to get scroll coordinates. **/
	var Auto = "auto";

	/** Uses the `Element.getBoundingClientRect()` method to get scroll coordinates. **/
	var Offset = "offset";

	/** Uses the `Element.offsetTop` and `Element.offsetLeft` properties to get scroll coordinates. **/
	var Position = "position";
}

/** Defines the options of a `ScrollSpy` instance. **/
typedef ScrollSpyOptions = {

	/** The method that the scrollspy uses to find which section the spied element is in. **/
	?method: ScrollSpyMethod,

	/** Pixels to offset from top when calculating position of scroll. **/
	?offset: Int,

	/** Specifies element to apply the scrollspy. **/
	?target: EitherType<Element, String>
}
