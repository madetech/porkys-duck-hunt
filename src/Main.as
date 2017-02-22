package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.KeyboardEvent;
	
	import scene.Background;
	import scene.Countdown;
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
		private var countdowns:Sprite;		
		private var currentRound:int;
		
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
		
			countdowns = new Sprite();
			addChild(countdowns);
			
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
		
		public function wonGame(currentScore:Number):void {
			//All rounds are won! So you gain a point!
			trace("Congratulations, your current score is: "+currentScore);
		}
		
		public function launchDuck():void {
			duck = new Duck();	
			ducks.addChild(duck);
		}
		
		public function loseAllPoints(highScore:Number):void {
			trace("You lose!");
			youLose = new YouLose();
			addChild(youLose);			
		}
		
		public function newRound(roundNumber:int):void {
			currentRound = roundNumber;
			
			for(var i:int = 0; i < dogs.numChildren; i++) {
				Dog(dogs.getChildAt(i)).retreat();
			}
		}
		
		public function countDown(seconds:int):void {
			for(var i:int = 0; i < countdowns.numChildren; i++) {
				countdowns.removeChildAt(i)
			}
			
			countdowns.addChild(new Countdown(seconds, currentRound));
		}
	}
}