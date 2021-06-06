package coconut.bootstrap;

/** A generic close button for dismissing content like modals and alerts. **/
class CloseButton {

	/** Value indicating whether this button is disabled. **/
	@:attribute var disabled: Bool = false;

	/** Value indicating whether this button is white. **/
	@:attribute var isWhite: Bool = false;

	/** The button label. **/
	@:attribute var label: String = "Close";

	/** The handler of "click" events. **/
	@:attribute function onClick(): Void;

	/** Renders this view. **/
	function render()
		<button aria-label=${label} class=${isWhite ? ["btn-close", "btn-close-white"] : ["btn-close"]} disabled=${disabled} type="button"></button>;
}
