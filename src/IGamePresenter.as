package
{
	public interface IGamePresenter
	{
		function wonRound():void
		function wonGame():void
		function launchDuck():void
		function showLoseState():void
		function newRound(roundNumber:int):void
		function countDown(second:int):void
	}
}