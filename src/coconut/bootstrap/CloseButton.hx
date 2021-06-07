package coconut.bootstrap;

/** A generic close button for dismissing content like modals and alerts. **/
class CloseButton extends View {

	/** Value indicating whether this button is disabled. **/
	@:attribute var disabled: Bool = false;

	/** The button label. **/
	@:attribute var label: String = "Close";

	/** Value indicating whether this button is white. **/
	@:attribute var white: Bool = false;

	/** The handler of "click" events. **/
	@:attribute function onClick(): Void;

	/** Renders this view. **/
	function render()
		<button aria-label=${label} class=${{"btn-close": true, "btn-close-white": white}} disabled=${disabled} type="button"></button>;
}
