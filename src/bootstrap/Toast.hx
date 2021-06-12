package bootstrap;

import haxe.extern.EitherType;
import js.html.Element;

/** A lightweight alert message. **/
@:native("bootstrap.Toast")
extern class Toast extends BaseComponent {

	/** Creates a new toast. **/
	function new(element: EitherType<Element, String>, ?options: ToastOptions);

	/** Hides an element's toast. **/
	function hide(): Void;

	/** Reveals an element's toast. **/
	function show(): Void;
}

/** Enumeration of events emitted by toasts. **/
enum abstract ToastEvent(String) to String {

	/** Fired immediately when the `Toast.hide()` method is called. **/
	var Hide = "hide.bs.toast";

	/** Fired when the toast has been hidden from the user. **/
	var Hidden = "hidden.bs.toast";

	/** Fired immediately when the `Toast.show()` method is called. **/
	var Show = "show.bs.toast";

	/** Fired when the toast has been made visible to the user. **/
	var Shown = "shown.bs.toast";
}

/** Defines the options of a `Toast` instance. **/
typedef ToastOptions = {

	/** Value indicating whether to apply a CSS fade transition to the toast. **/
	var ?animation: Bool;

	/** Value indicating whether to automatically hide the toast. **/
	var ?autohide: Bool;

	/** The delay, in milliseconds, for hiding the toast. **/
	var ?delay: Int;
}
