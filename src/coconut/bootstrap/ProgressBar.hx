package coconut.bootstrap;

/** A progress bar. **/
class ProgressBar extends View {

	/** Value indicating whether to animate the striped gradient. **/
	@:attribute var animated: Bool = false;

	/** The CSS classes. **/
	@:optional @:attribute var className: ClassName;

	/** The progress height, in CSS unit. **/
	@:optional @:attribute var height: String;

	/** The progress label. **/
	@:attribute var label: String = "";

	/** The maximum progress value. **/
	@:attribute var max: Float = 100;

	/** The minimum progress value. **/
	@:attribute var min: Float = 0;

	/** The current progress value. **/
	@:attribute var now: Float;

	/** Value indicating whether to apply a stripe via CSS gradient. **/
	@:attribute var striped: Bool = false;

	/** A contextual modifier. **/
	@:optional @:attribute var variant: Variant = Variant.Primary;

	/** Computes the percentage corresponding to the values in the specified range. **/
	static function getPercentage(now: Float, min = 0.0, max = 100.0) {
		final percentage = ((now - min) / (max - min)) * 100;
		return Math.round(percentage * 1000) / 1000;
	}

	/** Renders this view. **/
	function render()
		<div class=${className.add("progress")} style=${height != null ? {height: height} : null}>
			<div
				aria-valuemax=${max} aria-valuemin=${min} aria-valuenow=${now}
				class=${['bg-$variant' => variant != null, "progress-bar" => true, "progress-bar-animated" => animated, "progress-bar-striped" => striped]}
				role="progressbar"
				style=${{width: '${getPercentage(now, min, max)}%'}}>${label}</div>
		</div>
	;
}
