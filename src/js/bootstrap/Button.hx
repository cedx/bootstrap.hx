package js.bootstrap;

import haxe.extern.EitherType;
import js.html.Element;

/** A button. **/
@:native("bootstrap.Button")
extern class Button extends BaseComponent {

	/** Creates a new button. **/
	function new(element: EitherType<Element, String>);

	/** Gets the button instance associated with the specified DOM element. **/
	static function getInstance(element: EitherType<Element, String>): Button;

	/** Gets the button instance associated with the specified DOM element or creates a new one in case it wasn't initialized. **/
	static function getOrCreateInstance(element: EitherType<Element, String>): Button;

	/** Toggles the push state. **/
	function toggle(): Void;
}
