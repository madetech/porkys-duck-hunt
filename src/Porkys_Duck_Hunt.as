package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageDisplayState;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.utils.setTimeout;
	
	import scene.Background;
	import scene.Dog;
	import scene.Duck;
	import scene.YouLose;
	
	[SWF(width="1280", height="720", backgroundColor="#ffffff", frameRate="61")]
	public class Porkys_Duck_Hunt extends Sprite
	{
		private var background:Background;
		private var duck:Duck;	
		private var dog:Dog;
		private var youLose:YouLose;
		private var connection:PorkySocket;
		
		public function Porkys_Duck_Hunt()
		{			
			stage.displayState = StageDisplayState.FULL_SCREEN; 
			stage.scaleMode = StageScaleMode.EXACT_FIT; 
			stage.align = StageAlign.TOP_LEFT; 
					
			background = new Background();
			addChild(background);
			
			connection = new PorkySocket()
			connection.addEventListener(PorkyEvent.DUCK_HIT, duckHit);
			
			game();
		}
		
		private function showWonState():void {
			dog = new Dog();
			addChild(dog);
		}
		
		private function launchDuck():void {
			duck = new Duck();	
			addChild(duck);
		}
		
		private var hitAllowed:Boolean = false;
		private var hitDetected:Boolean = false;
		
		public function game():void
		{
			setTimeout(function():void {
				hitAllowed = true
				launchDuck()
				
				setTimeout(function():void {
					hitAllowed = false;
					if(hitDetected) {
					   trace("You win!")
					} else {
					   
					}
				}, 2000);
			}, 2000);
		}
		
		private function duckHit( e:PorkyEvent ):void 
		{
			if(hitAllowed) {
				hitDetected = true;
				showWonState();
			}
		}
	}
}