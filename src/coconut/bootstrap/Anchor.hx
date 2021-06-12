package coconut.bootstrap;

import tink.Url;

/** An anchor, also known as hyperlink. **/
class Anchor extends View {

	/** The view children. **/
	@:attribute var children: Children;

	/** The CSS classes. **/
	@:optional @:attribute var className: ClassName;

	/** Value indicating whether this anchor is disabled. **/
	@:attribute var disabled: Bool = false;

	/** The anchor URL. **/
	@:attribute var href: Url;

	/** The anchor URL. **/
	@:optional @:attribute var target: AnchorTarget;

	/** Renders this view. **/
	function render()
		<a class=${className.add(["disabled" => disabled])} href=${href} target=${target}>
			${...children}
		</a>
	;
}

/** Defines the target of an anchor. **/
enum abstract AnchorTarget(String) from String to String {

	/** Loads the response in a new browsing context. **/
	var Blank = "_blank";

	/** Loads the response in the parent browsing context of the current one. **/
	var Parent = "_parent";

	/** Loads the response in the current browsing context. **/
	var Self = "_self";

	/** Loads the response in the topmost browsing context. **/
	var Top = "_top";
}
