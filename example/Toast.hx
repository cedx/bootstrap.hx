import js.Browser.document;
import js.bootstrap.Toast;
import js.bootstrap.Variant;

/** Creates a toast and a button to open it. **/
function main() {
	document.body.innerHTML = render();

	final toast = document.querySelector(".toast");
	toast.addEventListener(ToastEvents.Hidden, () -> trace("The toast has been hidden."));
	toast.addEventListener(ToastEvents.Shown, () -> trace("The toast has been made visible."));

	final closeButton = toast.querySelector(".btn-close");
	closeButton.addEventListener("click", () -> Toast.getInstance(toast).hide());

	final openButton = document.getElementById("openButton");
	openButton.addEventListener("click", () -> Toast.getOrCreateInstance(toast).show());
}

/** Returns the HTML content of the document body. **/
private function render() return '
	<p>
		<button id="openButton" class="btn btn-${Variant.Primary}" type="button">
			Open toast
		</button>
	</p>

	<div class="toast-container position-absolute bottom-0 end-0 p-4">
		<div class="toast" data-bs-autohide="false">
			<div class="toast-header">
				<svg xmlns="http://www.w3.org/2000/svg" class="rounded me-2" width="20" height="20">
					<rect width="100%" height="100%" fill="#007aff"/>
				</svg>
				<strong class="me-auto">Bootstrap</strong>
				<small>2 seconds ago</small>
				<button class="btn-close" type="button"></button>
			</div>
			<div class="toast-body">
				Hello, world! This is a toast message.
			</div>
		</div>
	</div>
';
