package coconut.bootstrap;

/** Combines button groups into a toolbar. **/
class ButtonGroup extends View {

	/** The CSS classes. **/
	@:optional @:attribute var className: ClassName;

	/** The view children. **/
	@:attribute var children: Children;

	/** The group label. **/
	@:optional @:attribute var label: String;

	/** The group size. **/
	@:attribute var size: Size = Size.Medium;

	/** Value indicating whether this set of buttons appears vertically stacked. **/
	@:attribute var vertical: Bool = false;

	/** Renders this view. **/
	function render() '
		<let classes=${className.add(["btn-group" => !vertical, "btn-group-vertical" => vertical, 'btn-group-$size' => size != Medium])}>
			<div aria-label=${label} class=${classes} role="group">
				${...children}
			</div>
		</let>
	';
}
