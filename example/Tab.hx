import js.Browser.document;
import js.bootstrap.Tab;
import js.html.Element;

/** Creates a tabbed interface. **/
function main() {
	document.body.innerHTML = render();

	final buttons = document.querySelectorAll(".nav-tabs button");
	for (button in buttons) {
		button.addEventListener("click", () -> Tab.getOrCreateInstance(cast(button, Element)).show());
		button.addEventListener(TabEvents.Hidden, event -> trace('The "${event.target.textContent}" tab has been hidden.'));
		button.addEventListener(TabEvents.Shown, event -> trace('The "${event.target.textContent}" tab has been shown.'));
	}
}

/** Returns the HTML content of the document body. **/
private function render() return '
	<ul class="nav nav-tabs">
		<li class="nav-item">
			<button class="nav-link active" data-bs-target="#home" type="button">Home</button>
		</li>
		<li class="nav-item">
			<button class="nav-link" data-bs-target="#profile" type="button">Profile</button>
		</li>
		<li class="nav-item">
			<button class="nav-link" data-bs-target="#contact" type="button">Contact</button>
		</li>
	</ul>

	<div class="tab-content">
		<div id="home" class="tab-pane show active pt-2">
			This is some placeholder content for the <b>Home</b> tab\'s associated content.
		</div>
		<div id="profile" class="tab-pane pt-2">
			This is some placeholder content for the <b>Profile</b> tab\'s associated content.
		</div>
		<div id="contact" class="tab-pane pt-2">
			This is some placeholder content for the <b>Contact</b> tab\'s associated content.
		</div>
	</div>
';
