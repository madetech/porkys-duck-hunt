package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.KeyboardEvent;
	
	import scene.Background;
	import scene.Countdown;
	import scene.CurrentScore;
	import scene.Dog;
	import scene.Duck;
	import scene.WonGame;
	import scene.YouLose;
	
	[SWF(width="1280", height="720", backgroundColor="#3cbcfd", frameRate="61")]
	public class Main extends Sprite implements IGamePresenter
	{
		private var game:Game;
		private var background:Background;
		private var youLose:YouLose;
		private var connection:PorkySocket;
		private var dogs:Sprite;
		private var ducks:Sprite;
		private var scores:Sprite;
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
			
			scores = new Sprite();
			addChild(scores);
			
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
			dogs.addChild(new Dog());

			for(var i:int = 0; i < ducks.numChildren; i++) {
				Duck(ducks.getChildAt(i)).kill();
			}
		}
		
		public function wonGame(currentScore:Number):void {
			//All rounds are won! So you gain a point!
			trace("Congratulations, your current score is: "+currentScore);
			removeAllFromContainer(scores);
			scores.addChild(new WonGame(currentScore));
		}
		
		public function currentScore(score:Number):void {
			removeAllFromContainer(scores);
			scores.addChild(new CurrentScore(score));	
		}
		
		public function launchDuck():void {
			ducks.addChild(new Duck());
		}
		
		public function loseAllPoints(highScore:Number):void {
			trace("You lose!");
			youLose = new YouLose();
			scores.addChild(youLose);		
		
			dogs.addChild(new Dog(false));			
		}
		
		public function newRound(roundNumber:int):void {
			removeAllFromContainer(scores);
			currentRound = roundNumber;
			
			for(var i:int = 0; i < dogs.numChildren; i++) {
				Dog(dogs.getChildAt(i)).retreat();
			}
		}
		
		public function countDown(seconds:int):void {
			removeAllFromContainer(countdowns);
			
			countdowns.addChild(new Countdown(seconds, currentRound));
		}
		
		private function removeAllFromContainer(sprite:Sprite):void {
			for(var i:int = 0; i < sprite.numChildren; i++) {
				sprite.removeChildAt(i)
			}
		}
	}
}