package coconut.bootstrap;

/** A loading state indicator. **/
class Spinner extends View {

	/** The CSS classes. **/
	@:optional @:attribute var className: ClassName;

	/** Value indicating whether this spinner repeatedly grows. **/
	@:attribute var grow: Bool = false;

	/** The spinner label. **/
	@:optional @:attribute var label: String;

	/** The spinner size. **/
	@:attribute var size: Size = Size.Default;

	/** A contextual modifier. **/
	@:optional @:attribute var variant: Variant;

	/** Renders this view. **/
	function render()
		<let classes=${className.add([
			"spinner-border" => !grow, 'spinner-border-$size' => !grow && size != Default,
			"spinner-grow" => grow, 'spinner-grow-$size' => grow && size != Default,
			'text-$variant' => variant != null
		])}>
			<div class=${classes} role="status">
				<if ${label != null}>
					<span class="visually-hidden">${label}</span>
				</if>
			</div>
		</let>
	;
}
