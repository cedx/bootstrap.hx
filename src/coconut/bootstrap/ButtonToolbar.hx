package coconut.bootstrap;

/** Combines button groups into a toolbar. **/
class ButtonToolbar extends View {

	/** The CSS classes. **/
	@:optional @:attribute var className: ClassName;

	/** The view children. **/
	@:attribute var children: Children;

	/** The toolbar label. **/
	@:optional @:attribute var label: String;

	/** Renders this view. **/
	function render() '
		<div aria-label=${label} class=${className.add("btn-toolbar")} role="toolbar">
			${...children}
		</div>
	';
}
