package js.bootstrap;

import haxe.extern.EitherType;
import js.html.Element;

/** The base class for components. **/
extern abstract class BaseComponent {

	/** Creates a new component. **/
	function new(element: EitherType<Element, String>);

	/** Destroys this component. **/
	function dispose(): Void;
}
