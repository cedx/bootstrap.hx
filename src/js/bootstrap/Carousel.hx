package js.bootstrap;

import haxe.extern.EitherType;
import js.html.Element;
import js.html.Event;

/** A slideshow component for cycling through elements like a carousel. **/
@:native("bootstrap.Carousel")
extern class Carousel extends BaseComponent {

	/** Creates a new carousel. **/
	function new(element: EitherType<Element, String>, ?options: CarouselOptions);

	/** Gets the carousel instance associated with the specified DOM element. **/
	static function getInstance(element: EitherType<Element, String>): Carousel;

	/** Gets the carousel instance associated with the specified DOM element or creates a new one in case it wasn't initialized. **/
	static function getOrCreateInstance(element: EitherType<Element, String>, ?options: CarouselOptions): Carousel;

	/** Cycles through the carousel items from left to right. **/
	function cycle(?event: Event): Void;

	/** Cycles to the next item. **/
	function next(): Void;

	/** Don't cycle carousel to next when the page isn't visible or the carousel or its parent isn't visible. **/
	function nextWhenVisible(): Void;

	/** Stops the carousel from cycling through items. **/
	function pause(): Void;

	/** Cycles to the previous item. **/
	function prev(): Void;

	/** Cycles the carousel to a particular frame. **/
	function to(index: Int): Void;
}

/** Specifies the direction in which the carousel is sliding. **/
enum abstract CarouselDirection(String) to String {

	/** The carousel is sliding to the left. **/
	var Left = "left";

	/** The carousel is sliding to the right. **/
	var Right = "right";
}

/** An event for hooking into carousel functionality. **/
extern class CarouselEvent extends Event {

	/** The direction in which the carousel is sliding. **/
	final direction: CarouselDirection;

	/** The index of the current item. **/
	final from: Int;

	/** The DOM element that is being slid into place as the active item. **/
	final relatedTarget: Element;

	/** The index of the next item. **/
	final to: Int;
}

/** Enumeration of events emitted by carousels. **/
enum abstract CarouselEvents(String) to String {

	/** Fired when the carousel has completed its slide transition. **/
	var Slid = "slid.bs.carousel";

	/** Fired immediately when the `Carousel.slide()` method is called. **/
	var Slide = "slide.bs.carousel";
}

/** Defines the options of a `Carousel` instance. **/
typedef CarouselOptions = {

	/** The amount of time to delay between automatically cycling an item. If set to `false`, carousel will not automatically cycle. **/
	var ?interval: EitherType<Bool, Int>;

	/** Value indicating whether the carousel should react to keyboard events. **/
	var ?keyboard: Bool;

	/**
		If set to `"hover"`, pauses the cycling of the carousel on mouseenter and resumes the cycling of the carousel on mouseleave.
		If set to `false`, hovering over the carousel won't pause it.
	**/
	var ?pause: EitherType<Bool, String>;

	/** Autoplays the carousel after the user manually cycles the first item. If set to `"carousel"`, autoplays the carousel on load. **/
	var ?ride: EitherType<Bool, String>;

	/** Value indicating whether the carousel should support left/right swipe interactions on touchscreen devices. **/
	var ?touch: Bool;

	/** Value indicating whether the carousel should cycle continuously or have hard stops. **/
	var ?wrap: Bool;
}
