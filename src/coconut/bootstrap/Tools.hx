package coconut.bootstrap;

import haxe.Timer;
import js.Browser.window;
import js.html.Element;

/** Provides a set of utility methods. **/
abstract class Tools {

	/** Executes the specified `callback` after the transition defined for the given `element`. **/
	public static function executeAfterTransition(callback: () -> Void, transitionElement: Element, waitForTransition = true) {
		if (!waitForTransition) callback();
		else Timer.delay(callback, getTransitionDurationFromElement(transitionElement));
	}

	/** Gets the transition duration of the specified `element`, in milliseconds. **/
	public static function getTransitionDurationFromElement(element: Element) {
		final style = window.getComputedStyle(element);

		var transitionDelay = Std.parseFloat(style.transitionDelay.split(",")[0]);
		if (Math.isNaN(transitionDelay) || transitionDelay < 0) transitionDelay = 0;

		var transitionDuration = Std.parseFloat(style.transitionDuration.split(",")[0]);
		if (Math.isNaN(transitionDuration) || transitionDuration < 0) transitionDuration = 0;

		return Std.int((transitionDelay + transitionDuration) * 1000);
	}
}
