import js.Browser.document;
import js.bootstrap.Popover;
import js.bootstrap.Variant;
import js.html.Element;

/** Creates an popover and a button to open it. **/
function main() {
	document.body.innerHTML = render();

	final buttons = document.querySelectorAll(".btn");
	for (button in buttons) {
		new Popover(cast(button, Element), {trigger: '${PopoverTrigger.Focus} ${PopoverTrigger.Hover}'});
		button.addEventListener(PopoverEvent.Hidden, () -> trace("The popover has been hidden."));
		button.addEventListener(PopoverEvent.Shown, () -> trace("The popover has been made visible."));
	}
}

/** Returns the HTML content of the document body. **/
private function render() return '
	<button class="btn btn-${Variant.Danger}" data-bs-content="Top popover" data-bs-placement="${PopoverPlacement.Top}" type="button">
		Popover on top
	</button>

	<button class="btn btn-${Variant.Warning}" data-bs-content="Right popover" data-bs-placement="${PopoverPlacement.Right}" type="button">
		Popover on right
	</button>

	<button class="btn btn-${Variant.Info}" data-bs-content="Bottom popover" data-bs-placement="${PopoverPlacement.Bottom}" type="button">
		Popover on bottom
	</button>

	<button class="btn btn-${Variant.Success}" data-bs-content="Left popover" data-bs-placement="${PopoverPlacement.Left}" type="button">
		Popover on left
	</button>

	<button class="btn btn-primary" data-bs-content="<em>Popover</em> <u>with</u> <b>HTML</b>" data-bs-html="true" title="Popover title" type="button">
		Popover with HTML
	</button>
';
