import js.Browser.document;
import js.bootstrap.Button;

/** Creates a toggle button and an adjacent button to handle its state. **/
function main() {
	document.body.innerHTML = render();

	final toggleButton = Button.getOrCreateInstance(".btn-danger");
	final standardButton = document.querySelector(".btn-primary");
	standardButton.addEventListener("click", () -> toggleButton.toggle());
}

/** Returns the HTML content of the document body. **/
private function render() return '
	<div class="container">
		<button class="btn btn-danger" type="button">
			A toggle button
		</button>

		<button class="btn btn-primary ms-1" type="button">
			Toggle state of adjacent button
		</button>
	</div>
';
