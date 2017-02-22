package scene
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	public class CurrentScore extends Sprite
	{
		private var label:TextField;
		
		public function CurrentScore(score:Number)
		{
			super();
			drawScore(score)
		}
		
		private function drawScore(currentRound):void 
		{			
			var roundContainer:Sprite = new Sprite();
			addChild(roundContainer);
			roundContainer.x = (1280-100)/2;
			roundContainer.y = 5;	
			
			var format:TextFormat = new TextFormat();
			format.font = "Verdana";
			format.color = 0xFFFFFF;
			format.size = 92;
			format.align = "center";
			
			label = new TextField();
			label.defaultTextFormat = format;			
			label.text = currentRound;
			
			roundContainer.addChild(label);			
		}
	}
}