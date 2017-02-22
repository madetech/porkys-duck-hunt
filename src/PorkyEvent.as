package
{
	import flash.events.Event;

	public class PorkyEvent extends Event
	{
		public static var DUCK_HIT:String = "onDuckHit";
		
		public function PorkyEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
	}
}