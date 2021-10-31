import js.Browser.document;
import js.bootstrap.Button;
import js.bootstrap.Variant;

/** Creates a toggle button and an adjacent button to control its state. **/
function main() {
	document.body.innerHTML = render();

	final toggleButton = document.querySelector('.btn-${Variant.Danger}');
	final standardButton = document.querySelector('.btn-${Variant.Primary}');
	standardButton.addEventListener("click", () -> Button.getOrCreateInstance(toggleButton).toggle());
}

/** Returns the HTML content of the document body. **/
private function render() return '
	<button class="btn btn-${Variant.Danger}" type="button">
		A toggle button
	</button>

	<button class="btn btn-${Variant.Primary} ms-1" type="button">
		Toggle state of adjacent button
	</button>
';
