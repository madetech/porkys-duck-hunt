package
{
	public interface IGamePresenter
	{
		function wonRound():void
		function wonGame(currentScore:Number):void
		function launchDuck():void
		function loseAllPoints(highScore:Number):void
		function newRound(roundNumber:int):void
		function countDown(second:int):void
	}
}