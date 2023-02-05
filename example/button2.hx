import js.Browser.document;
import js.bootstrap.Button;
import js.bootstrap.Variant;

/** Creates a toggle button and an adjacent button to control its state. **/
function main() {
	document.body.innerHTML = render();

	final plainButton = document.querySelector('.btn-${Variant.Primary}');
	final toggleButton = document.querySelector('.btn-${Variant.Danger}');
	plainButton.addEventListener("click", () -> Button.getOrCreateInstance(toggleButton).toggle());
}

/** Returns the HTML content of the document body. **/
private function render() return '
	<button class="btn btn-${Variant.Primary}" type="button">
		Toggle state of adjacent button
	</button>

	<button class="btn btn-${Variant.Danger}" type="button">
		A toggle button
	</button>
';
