import js.Browser.document;
import js.bootstrap.Modal;
import js.bootstrap.Variant;

/** Creates a modal and a button to open it. **/
function main() {
	document.body.innerHTML = render();

	final modal = document.querySelector(".modal");
	modal.addEventListener(ModalEvent.Hidden, () -> trace("The modal has been hidden."));
	modal.addEventListener(ModalEvent.Shown, () -> trace("The modal has been made visible."));

	final closeButtons = modal.querySelectorAll("button");
	for (button in closeButtons) button.addEventListener("click", () -> Modal.getInstance(modal).hide());

	final openButton = document.getElementById("openButton");
	openButton.addEventListener("click", () -> Modal.getOrCreateInstance(modal).show());
}

/** Returns the HTML content of the document body. **/
private function render() return '
	<button id="openButton" class="btn btn-${Variant.Primary}" type="button">
		Open modal
	</button>

	<div class="modal fade" data-bs-backdrop="static">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Modal title</h5>
					<button class="btn-close" type="button"></button>
				</div>
				<div class="modal-body">
					<p>Modal body goes here.</p>
				</div>
				<div class="modal-footer">
					<button class="btn btn-${Variant.Primary}" type="button">Close</button>
				</div>
			</div>
		</div>
	</div>
';
