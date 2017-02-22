package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageDisplayState;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	
	import scene.Background;
	import scene.Duck;
	
	[SWF(width="1280", height="720", backgroundColor="#ffffff", frameRate="30")]
	
	public class Porkys_Duck_Hunt extends Sprite
	{
		private var background:Background;
		private var duck:Duck;	
		private var dog:Background;
		private var connection:PorkySocket;
		
		public function Porkys_Duck_Hunt()
		{			
			stage.displayState = StageDisplayState.FULL_SCREEN; 
			stage.scaleMode = StageScaleMode.EXACT_FIT; 
			stage.align = StageAlign.TOP_LEFT; 
					
			background = new Background();
			addChild(background);
			background.resize();
			
			stage.addEventListener(Event.RESIZE, function(e:Event) {
				trace('resized again');
				background.resize();
			});
			
			duck = new Duck();	
			addChild(duck);
			
			dog = new Background();
			connection = new PorkySocket()
			connection.addEventListener(PorkyEvent.DUCK_HIT, duckHit);
		}
		
		private function duckHit( e:PorkyEvent ) 
		{
			trace('DUCK HIT');	
		}
	}
}