package scene
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	public class WonGame extends Sprite
	{
		private var label:TextField;
		
		public function WonGame(score:Number)
		{
			super();
			drawScore(score)
		}
		
		private function drawScore(score):void 
		{			
			var roundContainer:Sprite = new Sprite();
			addChild(roundContainer);
			roundContainer.x = (1280-100)/2;
			roundContainer.y = (720-100)/2;	
			
			var format:TextFormat = new TextFormat();
			format.font = "Verdana";
			format.color = 0xFFFFFF;
			format.size = 100;
			format.align = "center";
			
			label = new TextField();
			label.defaultTextFormat = format;			
			label.text = score;
			
			roundContainer.addChild(label);			
		}
	}
}