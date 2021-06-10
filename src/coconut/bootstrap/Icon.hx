package coconut.bootstrap;

/** An icon based on the web font. **/
class Icon extends View {

	/** The CSS classes. **/
	@:optional @:attribute var className: ClassName;

	/** The icon name. **/
	@:attribute var name: String;

	/** Renders this view. **/
	function render()
		<i class=${className.add('bi-$name')}/>
	;
}
