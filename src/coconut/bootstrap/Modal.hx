package coconut.bootstrap;

import bootstrap.Modal as BsModal;
import js.html.Element;

/** A modal, also known as dialog box. **/
class Modal extends View {

	/** Value indicating whether to animate this modal. **/
	@:attribute var animated: Bool = false;

	/** The view children. **/
	@:attribute var children: Children;

	/** The CSS classes. **/
	@:optional @:attribute var className: ClassName;

	/** The root element. **/
	@:ref final root: Element;

	/** Value indicating whether this modal is scrollable. **/
	@:attribute var scrollable: Bool = false;

	/** Hides this modal. **/
	public function hide() BsModal.getInstance(root).hide();

	/** Opens this modal. **/
	public function show() BsModal.getInstance(root).show();

	/** Toggles this modal. **/
	public function toggle() BsModal.getInstance(root).toggle();

	/** Renders this view. **/
	function render()
		<div class=${className.add(["modal" => true, "fade" => animated])} ref=${root} tabIndex=${-1}>
			<div class=${["modal-dialog" => true, "modal-dialog-scrollable" => scrollable]}>
				<div class="modal-content">
					${...children}
				</div>
			</div>
		</div>
	;

	/** Method invoked after this view is mounted. **/
	override function viewDidMount() {
		final modal = new BsModal(root);
		beforeUnmounting(modal.dispose);
	}
}
