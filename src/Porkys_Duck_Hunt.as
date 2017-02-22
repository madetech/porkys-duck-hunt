package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageDisplayState;
	import flash.display.StageScaleMode;
	import flash.utils.setTimeout;
	
	import scene.Background;
	import scene.Dog;
	import scene.Duck;
	import scene.YouLose;
	
	[SWF(width="1280", height="720", backgroundColor="#3cbcfd", frameRate="61")]
	public class Porkys_Duck_Hunt extends Sprite implements IGamePresenter
	{
		private var game:Game;
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
			
			game = new Game(this);
			game.start();
			
			connection = new PorkySocket()
			connection.addEventListener(PorkyEvent.DUCK_HIT, game.duckHit);
		}
		
		public function showWonState():void {
			dog = new Dog();
			addChild(dog);
			
			removeChild(duck);
		}
		
		public function launchDuck():void {
			duck = new Duck();	
			addChild(duck);
		}
		
		public function showLoseState():void {
			youLose = new YouLose();
			addChild(youLose);			
		}
	
	}
}