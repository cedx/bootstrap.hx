import js.Browser.document;
import js.bootstrap.Alert;

/** Creates an alert and a button to handle its closure. **/
function main() {
	document.body.innerHTML = render();

	final alert = Alert.getOrCreateInstance(".alert");
	final button = document.querySelector(".btn");
	button.addEventListener("click", () -> alert.close());
}

/** Returns the HTML content of the document body. **/
private function render() return '
	<div class="container">
		<div class="alert alert-primary" role="alert">
			A simple primary alert - check it out!
		</div>

		<p>
			<button class="btn btn-primary" type="button">
				Close alert
			</button>
		</p>
	</div>
';
