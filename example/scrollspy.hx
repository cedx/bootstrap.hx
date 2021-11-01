import js.Browser.document;
import js.bootstrap.ScrollSpy;
import js.bootstrap.Variant;

/** Creates a scrollspy that updates an adjacent list group. **/
function main() {
	document.body.innerHTML = render();

	final scrollspy = document.getElementById("scrollspy");
	scrollspy.addEventListener(ScrollSpyEvent.Activate, () -> trace("A new item becomes activated by the scrollspy."));

	final listGroup = document.querySelector(".list-group");
	new ScrollSpy(scrollspy, {target: listGroup});
}

/** Returns the HTML content of the document body. **/
private function render() return '
	<style>
		#scrollspy {
			height: 165px;
			overflow-y: scroll;
			position: relative;
		}
	</style>

	<div class="row">
		<div class="col-4">
			<div class="list-group">
				<a class="list-group-item list-group-item-action" href="#list-item-1">Item 1</a>
				<a class="list-group-item list-group-item-action" href="#list-item-2">Item 2</a>
				<a class="list-group-item list-group-item-action" href="#list-item-3">Item 3</a>
				<a class="list-group-item list-group-item-action" href="#list-item-4">Item 4</a>
			</div>
		</div>

		<div class="col-8">
			<div id="scrollspy" data-bs-offset="0">
				<h4 id="list-item-1">Item 1</h4>
				<p>...</p>
				<p>...</p>

				<h4 id="list-item-2">Item 2</h4>
				<p>...</p>
				<p>...</p>

				<h4 id="list-item-3">Item 3</h4>
				<p>...</p>
				<p>...</p>

				<h4 id="list-item-4">Item 4</h4>
				<p>...</p>
				<p>...</p>
			</div>
		</div>
	</div>
';
