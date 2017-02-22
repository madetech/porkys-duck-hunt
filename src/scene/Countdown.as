package scene
{
	import com.greensock.TweenLite;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	public class Countdown extends Sprite
	{
		[Embed(source = "../../assets/countdown/2.png", mimeType = "image/png")]
		private var Count2Class:Class;	
		
		[Embed(source = "../../assets/countdown/3.png", mimeType = "image/png")]
		private var Count3Class:Class;	
		
		[Embed(source = "../../assets/round.png", mimeType = "image/png")]
		private var RoundClass:Class;			
		
		private var countdownBitmap:Bitmap;
		
		private var label:TextField;
		
		public function Countdown( seconds:int, currentRound:int )
		{
			super();
						
			if (seconds == 1) {
				drawRoundNumber(currentRound);
			} else {
				countdownBitmap = counterAssetFor(seconds);
				addChild( countdownBitmap );
				countdownBitmap.x = (1280-countdownBitmap.width)/2;
				countdownBitmap.y = (720-countdownBitmap.height)/2;	
			}
			
		}
		
		private function counterAssetFor(seconds:int) : Bitmap
		{
			switch(seconds) {
				case 2:
					return new Count2Class();
				case 3:
					return new Count3Class();
			}
			
			return new Count2Class();
		}
		
		
		private function drawRoundNumber(currentRound):void 
		{			
			var roundContainer:Sprite = new Sprite();
			addChild(roundContainer);
		
			var roundBoard:Bitmap = new RoundClass();
			roundContainer.addChild(roundBoard);
			
			roundContainer.x = (1280-roundBoard.width)/2;
			roundContainer.y = 720;
			
			var format:TextFormat = new TextFormat();
			format.font = "Verdana";
			format.color = 0xFFFFFF;
			format.size = 30;
			format.align = "center";
		
			label = new TextField();
			label.defaultTextFormat = format;			
			label.text = currentRound;
			label.y = 40;
			label.x = 20;
			
			roundContainer.addChild(label);			
			
			TweenLite.to(roundContainer, 0.5, {y:(720-roundBoard.height)/2});
			TweenLite.to(roundContainer, 0.5, {y:720, delay:1.5});			
		}
	}
}