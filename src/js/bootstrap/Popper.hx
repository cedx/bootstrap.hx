package js.bootstrap;

import haxe.extern.EitherType;
import js.html.Element;
import js.html.Node;

/** Specifies the overflow constraint boundary of a component. **/
enum abstract PopperBoundary(String) to String {

	/** The overflow is constrained by the clipping parents. **/
	var ClippingParents = "clippingParents";
}

/** Defines the options of a [Popper](https://popper.js.org) instance. **/
typedef PopperOptions = {

	/** The overflow constraint boundary of the component. **/
	var ?boundary: EitherType<PopperBoundary, Element>;

	/** The offset of the component relative to its target. **/
	var ?offset: EitherType<Array<Int>, EitherType<String, ({}, Node) -> Array<Int>>>;

	/** Changes the default [Popper](https://popper.js.org) configuration. **/
	var ?popperConfig: EitherType<{}, {} -> {}>;
}
