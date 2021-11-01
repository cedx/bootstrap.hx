import js.Browser.document;
import js.bootstrap.Offcanvas;
import js.bootstrap.Variant;

/** Creates an offcanvas element and a button to open it. **/
function main() {
	document.body.innerHTML = render();

	final offcanvas = document.querySelector(".offcanvas");
	offcanvas.addEventListener(OffcanvasEvent.Hidden, () -> trace("The offcanvas element has been hidden."));
	offcanvas.addEventListener(OffcanvasEvent.Shown, () -> trace("The offcanvas element has been made visible."));

	final closeButton = offcanvas.querySelector(".btn-close");
	closeButton.addEventListener("click", () -> Offcanvas.getInstance(offcanvas).hide());

	final openButton = document.getElementById("openButton");
	openButton.addEventListener("click", () -> Offcanvas.getOrCreateInstance(offcanvas).show());
}

/** Returns the HTML content of the document body. **/
private function render() return '
	<button class="btn btn-${Variant.Primary}" id="openButton" type="button">
		Open offcanvas element
	</button>

	<div class="offcanvas offcanvas-start" tabindex="-1">
		<div class="offcanvas-header">
			<h5 class="offcanvas-title">Offcanvas title</h5>
			<button class="btn-close" type="button"></button>
		</div>
		<div class="offcanvas-body">
			<p>Offcanvas body goes here.</p>
		</div>
	</div>
';
