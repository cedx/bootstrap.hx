package bootstrap;

import haxe.extern.EitherType;
import js.html.Element;

/** Represents an alert message. **/
@:native("bootstrap.Alert")
extern class Alert extends BaseComponent {

	/** Creates a new alert. **/
	function new(element: EitherType<Element, String>);

	/** Gets the alert instance associated with the specified DOM element. **/
	static function getInstance(element: Element): Alert;

	/** Closes an alert by removing it from the DOM. **/
	function close(): Void;
}

/** Enumeration of events emitted by alerts. **/
enum abstract AlertEvent(String) to String {

	/** Fired immediately when the `Alert.close()` method is called. **/
	var Close = "close.bs.alert";

	/** Fired when the alert has been closed. **/
	var Closed = "closed.bs.alert";
}
