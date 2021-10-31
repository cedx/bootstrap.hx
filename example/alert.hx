import js.Browser.document;
import js.bootstrap.Alert;
import js.bootstrap.Variant;

/** Creates an alert and a button to handle its closure. **/
function main() {
	document.body.innerHTML = render();

	final alert = document.querySelector(".alert");
	alert.addEventListener(AlertEvent.Closed, () -> trace("The alert has been closed."));

	final button = document.querySelector(".btn");
	button.addEventListener("click", () -> Alert.getOrCreateInstance(alert).close());
}

/** Returns the HTML content of the document body. **/
private function render() return '
	<div class="container">
		<div class="alert alert-${Variant.Primary}" role="alert">
			A simple primary alert - check it out!
		</div>

		<p>
			<button class="btn btn-${Variant.Primary}" type="button">
				Close alert
			</button>
		</p>
	</div>
';
