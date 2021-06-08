package coconut.bootstrap;

/** A small count and labeling component. **/
class Badge extends View {

	/** The view children. **/
	@:attribute var children: Children;

	/** Value indicating whether to make this badge more rounded. **/
	@:attribute var pill: Bool = false;

	/** A contextual modifier. **/
	@:attribute var variant: Variant = Variant.Primary;

	/** Renders this view. **/
	function render()
		<span class=${{badge: true, 'bg-$variant': true, "rounded-pill": pill}}>${...children}</span>
	;
}
