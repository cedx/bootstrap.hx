package js.bootstrap;

import haxe.extern.EitherType;
import js.html.Element;

/** The base class for components. **/
extern abstract class BaseComponent {

	/** The version number of the [Bootstrap](https://getbootstrap.com) library. **/
	static final VERSION: String;

	/** Creates a new component. **/
	function new(element: EitherType<Element, String>);

	/** Gets the component instance associated with the specified DOM element. **/
	static function getInstance(element: EitherType<Element, String>): BaseComponent;

	/** Gets the component instance associated with the specified DOM element or creates a new one in case it wasn't initialized. **/
	static function getOrCreateInstance(element: EitherType<Element, String>): BaseComponent;

	/** Destroys this component. **/
	function dispose(): Void;
}
