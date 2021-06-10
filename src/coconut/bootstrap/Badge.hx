package coconut.bootstrap;

/** A small count and labeling component. **/
class Badge extends View {

	/** The view children. **/
	@:attribute var children: Children;

	/** The CSS classes. **/
	@:optional @:attribute var className: ClassName;

	/** Value indicating whether to make this badge more rounded. **/
	@:attribute var pill: Bool = false;

	/** A contextual modifier. **/
	@:attribute var variant: Variant = Variant.Primary;

	/** Renders this view. **/
	function render()
		<span class=${className.add(["badge" => true, 'bg-$variant' => true, "rounded-pill" => pill])}>
			${...children}
		</span>
	;
}
