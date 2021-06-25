package coconut.bootstrap;

/** A generic close button for dismissing content like modals and alerts. **/
class CloseButton extends View {

	/** The CSS classes. **/
	@:optional @:attribute var className: ClassName;

	/** Value indicating whether this button is disabled. **/
	@:attribute var disabled: Bool = false;

	/** The button label. **/
	@:optional @:attribute var label: String;

	/** Value indicating whether this button is white. **/
	@:attribute var white: Bool = false;

	/** Fired when this button has been clicked. **/
	@:attribute function onClick(): Void;

	/** Renders this view. **/
	function render() '
		<let classes=${className.add(["btn-close" => true, "btn-close-white" => white])}>
			<button aria-label=${label} class=${classes} disabled=${disabled} onclick=${onClick} type="button"></button>
		</let>
	';
}
