package bootstrap;

import haxe.Constraints.Function;

/** Abstract type for events. Its type parameter is a signature of a listener for a concrete event. **/
abstract Event<T:Function>(Dynamic) from String to String {}
