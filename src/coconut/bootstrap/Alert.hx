package coconut.bootstrap;

import js.html.Element;
import tink.Url;

/** An alert message. **/
class Alert extends View {

	/** Value indicating whether to animate this alert when dismissing it. **/
	@:attribute var animate: Bool = false;

	/** The view children. **/
	@:attribute var children: Children;

	/** The CSS classes. **/
	@:optional @:attribute var className: ClassName;

	/** The label of the close button. **/
	@:optional @:attribute var closeLabel: String;

	/** Value indicating whether this alert is dismissible. **/
	@:attribute var dismissible: Bool = false;

	/** Fired immediately when the `close()` method is called. **/
	@:optional @:attribute function onClose(): Void;

	/** Fired when this alert has been closed. **/
	@:optional @:attribute function onClosed(): Void;

	/** The root element. **/
	@:ref final root: Element;

	/** Value indicating whether to show this alert. **/
	@:state var show: Bool = true;

	/** A contextual modifier. **/
	@:attribute var variant: Variant = Variant.Primary;

	/** Creates an alert heading. **/
	public static function Heading(attrs: {children: Children, ?className: ClassName}) return hxx('
		<h4 class=${attrs.className.add("alert-heading")}>${...attrs.children}</h4>
	');

	/** Creates an alert link. **/
	public static function Link(attrs: {children: Children, ?className: ClassName, href: Url, ?target: Anchor.AnchorTarget}) return hxx('
		<Anchor class=${attrs.className.add("alert-link")} href=${attrs.href} target=${attrs.target}>${...attrs.children}</Anchor>
	');

	/** Closes this alert by removing it from the DOM. **/
	public function close() {
		onClose();
		root.classList.remove("show");
		Tools.executeAfterTransition(() -> {
			show = false;
			onClosed();
		}, root, animate);
	}

	/** Renders this view. **/
	function render()
		<if ${show}>
			<let classes=${className.add(["alert" => true, 'alert-$variant' => true, "alert-dismissible" => dismissible, "fade" => animate, "show" => animate])}>
				<div class=${classes} ref=${root} role="alert">
					${...children}
					<if ${dismissible}>
						<CloseButton label=${closeLabel} onClick=${close}/>
					</if>
				</div>
			</let>
		</if>
	;
}
