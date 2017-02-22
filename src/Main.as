package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageDisplayState;
	import flash.display.StageScaleMode;
	import flash.events.KeyboardEvent;
	
	import scene.Background;
	import scene.Dog;
	import scene.Duck;
	import scene.YouLose;
	
	[SWF(width="1280", height="720", backgroundColor="#3cbcfd", frameRate="61")]
	public class Main extends Sprite implements IGamePresenter
	{
		private var game:Game;
		private var background:Background;
		private var duck:Duck;	
		private var dog:Dog;
		private var youLose:YouLose;
		private var connection:PorkySocket;
		private var dogs:Sprite;
		private var ducks:Sprite;
		
		public function Main()
		{			
//			stage.displayState = StageDisplayState.FULL_SCREEN; 
			stage.scaleMode = StageScaleMode.EXACT_FIT; 
			stage.align = StageAlign.TOP_LEFT; 
			stage.addEventListener(KeyboardEvent.KEY_UP, bypassDuckHit);
					
			dogs = new Sprite();
			addChild(dogs);
			
			ducks = new Sprite();
			addChild(ducks);			
			
			background = new Background();
			addChild(background);
			
			game = new Game(this);
			game.start();
			
			connection = new PorkySocket()
			connection.addEventListener(PorkyEvent.DUCK_HIT, game.duckHit);
		}
		
		private function bypassDuckHit(e:KeyboardEvent) : void
		{
			game.duckHit( new PorkyEvent(PorkyEvent.DUCK_HIT) );
		}
		
		public function wonRound():void {
			dog = new Dog();
			dogs.addChild(dog);
			
			duck.kill();
		}
		
		public function wonGame():void {
			//All rounds are won!
			trace("Congratulations, you won a prize!");
		}
		
		public function launchDuck():void {
			duck = new Duck();	
			ducks.addChild(duck);
		}
		
		public function showLoseState():void {
			youLose = new YouLose();
			addChild(youLose);			
		}
		
		public function newRound(roundNumber:int):void {
			//todo
			trace("it is round number " + roundNumber);
		}
		
		public function countDown(seconds:int):void {
			trace("count down " + seconds);
		}
	
	}
}