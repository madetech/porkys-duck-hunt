package
{
	import flash.utils.setTimeout;

	public class Game
	{
		private var ui:IGamePresenter;
		private var hitAllowed:Boolean = false;
		private var hitDetected:Boolean = false;
		
		public function Game( ui:IGamePresenter )
		{
			this.ui = ui;
		}
		
		public function start():void
		{
			setTimeout(function():void {
				hitAllowed = true
				ui.launchDuck()
				
				setTimeout(function():void {
					hitAllowed = false;
					if(!hitDetected) {
						ui.showLoseState();
					}
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