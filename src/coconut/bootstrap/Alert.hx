package coconut.bootstrap;

import js.html.Element;

/** Represents an alert message. **/
class Alert extends View {

	/** Value indicating whether to animate this alert when dismissing it. **/
	@:attribute var animate: Bool = true;

	/** The view children. **/
	@:attribute var children: Children;

	/** The applied CSS classes. **/
	@:optional @:attribute var className: ClassName;

	/** The label of the close button. **/
	@:attribute var closeLabel: String = "Close";

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
			<div class=${className.add({alert: true, 'alert-$variant': true, "alert-dismissible": dismissible, fade: animate, show: true})} role="alert">
				${...children}
				<if ${dismissible}>
					<CloseButton label=${closeLabel} onClick=${close}/>
				</if>
			</div>
		</if>
	;
}
