import js.Browser.document;
import js.bootstrap.Tooltip;
import js.bootstrap.Variant;
import js.html.Element;

/** Creates buttons with an associated tooltip. **/
function main() {
	document.body.innerHTML = render();

	final buttons = document.querySelectorAll(".btn");
	for (button in buttons) {
		new Tooltip(cast(button, Element));
		button.addEventListener(TooltipEvent.Hidden, () -> trace("The tooltip has been hidden."));
		button.addEventListener(TooltipEvent.Shown, () -> trace("The tooltip has been made visible."));
	}
}

/** Returns the HTML content of the document body. **/
private function render() return '
	<button class="btn btn-${Variant.Danger}" data-bs-placement="${TooltipPlacement.Top}" title="Tooltip on top" type="button">
		Tooltip on top
	</button>

	<button class="btn btn-${Variant.Warning}" data-bs-placement="${TooltipPlacement.Right}" title="Tooltip on right" type="button">
		Tooltip on right
	</button>

	<button class="btn btn-${Variant.Info}" data-bs-placement="${TooltipPlacement.Bottom}" title="Tooltip on bottom" type="button">
		Tooltip on bottom
	</button>

	<button class="btn btn-${Variant.Success}" data-bs-placement="${TooltipPlacement.Left}" title="Tooltip on left" type="button">
		Tooltip on left
	</button>

	<button class="btn btn-${Variant.Primary}" data-bs-html="true" title="<em>Tooltip</em> <u>with</u> <b>HTML</b>" type="button">
		Tooltip with HTML
	</button>
';
