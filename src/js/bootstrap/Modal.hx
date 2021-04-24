package js.bootstrap;

import haxe.extern.EitherType;
import js.html.Element;

/** Represents a modal, also known as dialog box. **/
@:native("bootstrap.Modal")
extern class Modal {

	/** Creates a new modal. **/
	function new(element: EitherType<Element, String>, ?options: ModalOptions);

	/** Gets the modal instance associated with the specified DOM element. **/
	static function getInstance(element: Element): Modal;

	/** Destroys this modal. **/
	function dispose(): Void;

	/** Readjusts this modal's position. **/
	function handleUpdate(): Void;

	/** Hides this modal. **/
	function hide(): Void;

	/** Opens this modal. **/
	function show(): Void;

	/** Toggles this modal. **/
	function toggle(): Void;
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
