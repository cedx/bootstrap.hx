import js.Browser.document;
import js.bootstrap.Dropdown;
import js.bootstrap.Variant;

/** Creates a dropdown menu and a button to control its visibility. **/
function main() {
	document.body.innerHTML = render();

	final dropdown = document.querySelector(".dropdown-toggle");
	dropdown.addEventListener("click", () -> Dropdown.getOrCreateInstance(dropdown).toggle());
	dropdown.addEventListener(DropdownEvents.Hidden, () -> trace("The dropdown menu has been hidden."));
	dropdown.addEventListener(DropdownEvents.Shown, () -> trace("The dropdown menu has been made visible."));
}

/** Returns the HTML content of the document body. **/
private function render() return '
	<div class="dropdown">
		<button class="btn btn-${Variant.Primary} dropdown-toggle" type="button">
			Toggle dropdown menu
		</button>

		<ul class="dropdown-menu">
			<li><a class="dropdown-item" href="#">Action</a></li>
			<li><a class="dropdown-item" href="#">Another action</a></li>
			<li><a class="dropdown-item" href="#">Something else here</a></li>
		</ul>
	</div>
';
