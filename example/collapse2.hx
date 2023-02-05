import js.Browser.document;
import js.bootstrap.Collapse;
import js.bootstrap.Variant;

/** Creates a collapse element and a button to control its visibility. **/
function main() {
	document.body.innerHTML = render();

	final collapse = document.querySelector(".collapse");
	collapse.addEventListener(CollapseEvent.Hidden, () -> trace("The collapse element has been hidden."));
	collapse.addEventListener(CollapseEvent.Shown, () -> trace("The collapse element has been made visible."));

	final button = document.querySelector(".btn");
	button.addEventListener("click", () -> Collapse.getOrCreateInstance(collapse).toggle());
}

/** Returns the HTML content of the document body. **/
private function render() return '
	<p>
		<button class="btn btn-${Variant.Primary}" type="button">
			Toggle content
		</button>
	</p>

	<div class="collapse">
		<div class="card">
			<div class="card-body">
				Some placeholder content for the collapse component.
			</div>
		</div>
	</div>
';
