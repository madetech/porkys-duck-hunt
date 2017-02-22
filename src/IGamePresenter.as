package
{
	public interface IGamePresenter
	{
		function showWonState():void
		function launchDuck():void
		function showLoseState():void
		function newRound(roundNumber:int):void
		function countDown(second:int):void
	}
}