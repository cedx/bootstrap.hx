package bootstrap;

import haxe.extern.EitherType;
import js.html.Element;

/** Represents a modal, also known as dialog box. **/
@:native("bootstrap.Modal")
extern class Modal extends BaseComponent {

	/** Creates a new modal. **/
	function new(element: EitherType<Element, String>, ?options: ModalOptions);

	/** Gets the modal instance associated with the specified DOM element. **/
	static function getInstance(element: Element): Modal;

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
enum abstract ModalEvent(String) {

	/** Fired immediately when the `Modal.hide()` method is called. **/
	var Hide = "hide.bs.modal";

	/**
		Fired when the modal is shown, its backdrop is `static` and a click outside the modal
		or an escape key press is performed with the `keyboard` set to `false`.
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

	/** Value indicating whether to include a modal-backdrop element. **/
	var ?backdrop: EitherType<Bool, String>;

	/** Value indicating whether to put the focus on the modal when initialized. **/
	var ?focus: Bool;

	/** Value indicating whether to close the modal when escape key is pressed. **/
	var ?keyboard: Bool;
}
