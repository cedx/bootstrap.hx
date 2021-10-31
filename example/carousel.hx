import js.Browser.document;
import js.bootstrap.Carousel;
import js.bootstrap.Variant;

/** Creates a toggle button and an adjacent button to handle its state. **/
function main() {
	document.body.innerHTML = render();

	final carousel = document.querySelector(".carousel");
	carousel.addEventListener(CarouselEvent.Slid, () -> trace("The carousel has completed its slide transition."));

	final playButton = document.querySelector('.btn-${Variant.Primary}');
	playButton.addEventListener("click", () -> Carousel.getOrCreateInstance(carousel).cycle());

	final pauseButton = document.querySelector('.btn-${Variant.Secondary}');
	pauseButton.addEventListener("click", () -> Carousel.getOrCreateInstance(carousel).pause());
}

/** Returns the HTML content of the document body. **/
private function render() return '
	<div class="container">
		<p>
			<button class="btn btn-${Variant.Primary}" type="button">
				Play
			</button>
			<button class="btn btn-${Variant.Secondary} ms-1" type="button">
				Pause
			</button>
		</p>

		<div class="carousel slide" data-bs-interval="2000">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img class="d-block w-100" src="img/1.jpg"/>
				</div>

				<div class="carousel-item">
					<img class="d-block w-100" src="img/2.jpg"/>
				</div>

				<div class="carousel-item">
					<img class="d-block w-100" src="img/3.jpg"/>
				</div>
			</div>
		</div>
	</div>
';
