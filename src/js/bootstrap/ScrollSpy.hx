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
enum abstract ScrollSpyEvents(String) to String {

	/** Fired on the scroll element whenever a new item becomes activated by the scrollspy. **/
	var Activate = "activate.bs.scrollspy";
}

/** Defines the options of a `ScrollSpy` instance. **/
typedef ScrollSpyOptions = {

	/** The `rootMargin` of the intersection observer. **/
	var ?rootMargin: String;

	/** Enables smooth scrolling. **/
	var ?smoothScroll: Bool;

	/** Specifies element to apply the scrollspy. **/
	var ?target: EitherType<Element, String>;
}
