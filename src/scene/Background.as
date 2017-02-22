package scene
{
	import flash.display.Sprite;
	import flash.display.Bitmap;
	
	public class Background extends Sprite
	{
		[Embed(source = "../../assets/landscape.png", mimeType = "image/png")]
		private var BackgroundImg:Class;
		private var backgroundImageSprite:Bitmap;
		
		public function Background()
		{
			backgroundImageSprite = new BackgroundImg();
			addChild(backgroundImageSprite);	
		}
		
		public function resize() :void
		{
			trace('resized');
			trace(stage.width);
			
			backgroundImageSprite.width = stage.width;
			backgroundImageSprite.height = stage.height;			
		}
	}
}