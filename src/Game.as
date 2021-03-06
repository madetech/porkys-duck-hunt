package
{
	import flash.utils.setTimeout;

	public class Game
	{
		private var ui:IGamePresenter;
		private var hitAllowed:Boolean = false;
		private var hitDetected:Boolean = false;
		private var roundNumber:int = 1;
		private var currentScore:int = 0;
		
		public function Game( ui:IGamePresenter )
		{
			this.ui = ui;
		}
		
		public function start():void
		{
			beginRound();
		}
	
		public function beginRound():void {
			var secondDelay:Number = Math.random() * 10000;
			
			runSequentially(
				new Array( 
					new Array(5000, function():void { 
						ui.newRound(roundNumber) 
						ui.currentScore(currentScore)
					} ),
					new Array(1000, function():void { ui.countDown(3); }),
					new Array(1000, function():void { ui.countDown(2); }),
					new Array(1000, function():void { ui.countDown(1); }),
					new Array(secondDelay, playRound),
					new Array(10000, endRound)
				)
			);
		}
		
		private function playRound():void {
			hitAllowed = true
			ui.launchDuck()
		}
		
		private function endRound():void {
			hitAllowed = false;
			if(hitDetected) {
				hitDetected = false;
				
				roundNumber++;				
					
				if(roundNumber > 3) {
				    ui.wonGame(currentScore);
					roundNumber = 1;
					
					return beginRound();
				}
				if(roundNumber <= 3) return beginRound();
			} 
			
			ui.loseAllPoints(currentScore);	
			currentScore = 0;
			start();
		}
		
		public function runSequentially(actions:Array):void {			
			var currentAction = actions.shift();
			
			if(!currentAction) return;
			
			var currentActionDelay = currentAction[0];
			var currentActionFunction = currentAction[1];
			
			setTimeout(function() {
				currentActionFunction();
				runSequentially(actions)
			}, currentActionDelay);
		}
		
		public function duckHit( e:PorkyEvent ):void 
		{
			if(hitAllowed) {
				hitAllowed = false;
				currentScore++					
				hitDetected = true;
				ui.wonRound();
				ui.currentScore(currentScore)					
			}
		}
	}
}