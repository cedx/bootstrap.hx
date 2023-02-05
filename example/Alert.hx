import js.Browser.document;
import js.bootstrap.Alert;
import js.bootstrap.Variant;

/** Creates an alert and a button to dismiss it. **/
function main() {
	document.body.innerHTML = render();

	final alert = document.querySelector(".alert");
	alert.addEventListener(AlertEvents.Closed, () -> trace("The alert has been closed."));

	final button = document.querySelector(".btn");
	button.addEventListener("click", () -> Alert.getOrCreateInstance(alert).close());
}

/** Returns the HTML content of the document body. **/
private function render() return '
	<p>
		<button class="btn btn-${Variant.Primary}" type="button">
			Close alert
		</button>
	</p>

	<div class="alert alert-${Variant.Info}">
		A simple info alert - check it out!
	</div>
';
