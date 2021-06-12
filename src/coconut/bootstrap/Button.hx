package coconut.bootstrap;

import js.html.Event;

/** A button. **/
class Button extends View {

	/** The view children. **/
	@:attribute var children: Children;

	/** The CSS classes. **/
	@:optional @:attribute var className: ClassName;

	/** Value indicating whether this button is disabled. **/
	@:attribute var disabled: Bool = false;

	/** Fired when this button has been clicked. **/
	@:optional @:attribute function onClick(event: Event): Void;

	/** Value indicating whether this button is outlined. **/
	@:attribute var outline: Bool = false;

	/** The button size. **/
	@:attribute var size: Size = Size.Default;

	/** The button type. **/
	@:attribute var type: ButtonType = Button;

	/** A contextual modifier. **/
	@:attribute var variant: Variant = Variant.Primary;

	/** Renders this view. **/
	function render()
		<let classes=${className.add(["btn" => true, 'btn-$variant' => !outline, 'btn-outline-$variant' => outline, 'btn-$size' => size != Default])}>
			<button class=${classes} disabled=${disabled} onclick=${onClick} type=${type}>
				${...children}
			</button>
		</let>
	;
}

/** Defines the type of a button. **/
enum abstract ButtonType(String) from String to String {

	/** A generic button. **/
	var Button = "button";

	/** A reset button **/
	var Reset = "reset";

	/** A submit button. **/
	var Submit = "submit";
}
