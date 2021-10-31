import js.Browser.document;
import js.bootstrap.Modal;
import js.bootstrap.Variant;

/** Creates a modal and a button to show it. **/
function main() {
	document.body.innerHTML = render();

	final modal = document.querySelector(".modal");
	modal.addEventListener(ModalEvent.Hidden, () -> trace("The modal has been hidden."));
	modal.addEventListener(ModalEvent.Shown, () -> trace("The modal has been made visible."));

	final closeButtons = modal.querySelectorAll("button");
	for (button in closeButtons) button.addEventListener("click", () -> Modal.getInstance(modal).hide());

	final showButton = document.getElementById("showButton");
	showButton.addEventListener("click", () -> Modal.getOrCreateInstance(modal).show());
}

/** Returns the HTML content of the document body. **/
private function render() return '
	<button class="btn btn-${Variant.Primary}" id="showButton" type="button">
		Launch demo modal
	</button>

	<div class="modal fade" data-bs-backdrop="static" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Modal title</h5>
					<button class="btn-close" type="button"></button>
				</div>

				<div class="modal-body">
					<p>Modal body text goes here.</p>
				</div>

				<div class="modal-footer">
					<button class="btn btn-${Variant.Primary}" type="button">Close</button>
				</div>
			</div>
		</div>
	</div>
';
