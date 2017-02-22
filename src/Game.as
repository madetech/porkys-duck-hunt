package
{
	import flash.utils.setTimeout;

	public class Game
	{
		private var ui:IGamePresenter;
		private var hitAllowed:Boolean = false;
		private var hitDetected:Boolean = false;
		private var roundNumber:int = 1;
		
		public function Game( ui:IGamePresenter )
		{
			this.ui = ui;
		}
		
		public function start():void
		{
			beginRound();
		}
	
		public function beginRound():void {
			ui.newRound(roundNumber);
			
			setTimeout(function():void {
				hitAllowed = true
				ui.launchDuck()
				
				setTimeout(function():void {
					hitAllowed = false;
					if(hitDetected) {
						roundNumber++;
						if(roundNumber <= 3) return beginRound();
					} 
					
					ui.showLoseState();	
				}, 2000);
			}, 2000);
		}
		
		public function duckHit( e:PorkyEvent ):void 
		{
			if(hitAllowed) {
				hitDetected = true;
				ui.showWonState();
			}
		}
	}
}