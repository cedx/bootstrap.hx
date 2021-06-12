package bootstrap;

import haxe.extern.EitherType;
import js.html.Element;
import js.html.Event;

/** A slideshow component for cycling through elements like a carousel. **/
@:native("bootstrap.Carousel")
extern class Carousel extends BaseComponent {

	/** Creates a new carousel. **/
	function new(element: EitherType<Element, String>, ?options: CarouselOptions);

	/** Cycles through the carousel items from left to right. **/
	function cycle(?event: Event): Void;

	/** Cycles to the next item. **/
	function next(): Void;

	/** Don't cycle carousel to next when the page isn't visible or the carousel or its parent isn't visible. **/
	function nextWhenVisible(): Void;

	/** Stops the carousel from cycling through items. **/
	function pause(?event: Event): Void;

	/** Cycles to the previous item. **/
	function prev(): Void;

	/** Cycles the carousel to a particular frame. **/
	function to(index: Int): Void;
}

/** Enumeration of events emitted by carousels. **/
enum abstract CarouselEvent(String) to String {

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
