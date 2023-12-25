package js.bootstrap;

import haxe.extern.EitherType;
import js.html.Element;

/** A lightweight alert message. **/
@:native("bootstrap.Toast")
extern class Toast extends BaseComponent {

	/** The default options. **/
	static final Default: ToastOptions;

	/** The component name. **/
	static final NAME: String;

	/** Creates a new toast. **/
	function new(element: EitherType<Element, String>, ?options: ToastOptions);

	/** Gets the toast instance associated with the specified DOM element. **/
	static function getInstance(element: EitherType<Element, String>): Null<Toast>;

	/** Gets the toast instance associated with the specified DOM element or creates a new one in case it wasn't initialized. **/
	static function getOrCreateInstance(element: EitherType<Element, String>, ?options: ToastOptions): Toast;

	/** Hides the element's toast. **/
	function hide(): Void;

	/** Gets a value indicating whether the element's toast is shown. **/
	function isShown(): Bool;

	/** Reveals the element's toast. **/
	function show(): Void;
}

/** Enumeration of events emitted by toasts. **/
enum abstract ToastEvents(String) to String {

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
