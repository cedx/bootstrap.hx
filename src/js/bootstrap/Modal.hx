package js.bootstrap;

import haxe.extern.EitherType;
import js.html.Element;

/** A modal, also known as dialog box. **/
@:native("bootstrap.Modal")
extern class Modal extends BaseComponent {

	/** The default options. **/
	static final Default: ModalOptions;

	/** The component name. **/
	static final NAME: String;

	/** Creates a new modal. **/
	function new(element: EitherType<Element, String>, ?options: ModalOptions);

	/** Gets the modal instance associated with the specified DOM element. **/
	static function getInstance(element: EitherType<Element, String>): Null<Modal>;

	/** Gets the modal instance associated with the specified DOM element or creates a new one in case it wasn't initialized. **/
	static function getOrCreateInstance(element: EitherType<Element, String>, ?options: ModalOptions): Modal;

	/** Readjusts this modal's position. **/
	function handleUpdate(): Void;

	/** Hides this modal. **/
	function hide(): Void;

	/** Opens this modal. **/
	function show(): Void;

	/** Toggles this modal. **/
	function toggle(): Void;
}

/** Enumeration of events emitted by modals. **/
enum abstract ModalEvents(String) to String {

	/** Fired immediately when the `Modal.hide()` method is called. **/
	var Hide = "hide.bs.modal";

	/**
		Fired when the modal is shown, its backdrop is `static` and a click outside the modal
		or an escape key press is performed with the `keyboard` option set to `false`.
	**/
	var HidePrevented = "hidePrevented.bs.modal";

	/** Fired when the modal has been hidden from the user. **/
	var Hidden = "hidden.bs.modal";

	/** Fired immediately when the `Modal.show()` method is called. **/
	var Show = "show.bs.modal";

	/** Fired when the modal has been made visible to the user. **/
	var Shown = "shown.bs.modal";
}

/** Defines the options of a `Modal` instance. **/
typedef ModalOptions = {

	/** Value indicating whether to include a modal-backdrop element. Specify `"static"` for a backdrop which doesn't close the modal on click. **/
	var ?backdrop: EitherType<Bool, String>;

	/** Value indicating whether to put the focus on the modal when initialized. **/
	var ?focus: Bool;

	/** Value indicating whether to close the modal when escape key is pressed. **/
	var ?keyboard: Bool;
}
