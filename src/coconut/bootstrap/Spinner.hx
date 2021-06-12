package coconut.bootstrap;

/** A loading state indicator. **/
class Spinner extends View {

	/** The spinner animation. **/
	@:attribute var animation: SpinnerAnimation = Border;

	/** The view children. **/
	@:attribute var children: Children;

	/** The CSS classes. **/
	@:optional @:attribute var className: ClassName;

	/** The spinner size. **/
	@:attribute var size: Size = Size.Default;

	/** A contextual modifier. **/
	@:optional @:attribute var variant: Variant;

	/** Renders this view. **/
	function render()
		<let classes=${className.add(['spinner-$animation' => true, 'spinner-$animation-$size' => size != Default, 'text-$variant' => variant != null])}>
			<div class=${classes} role="status">
				${...children}
			</div>
		</let>
	;
}

/** Defines the animation of a spinner. **/
enum abstract SpinnerAnimation(String) from String {

	/** A border spinner. **/
	var Border = "border";

	/** A grow spinner. **/
	var Grow = "grow";
}
