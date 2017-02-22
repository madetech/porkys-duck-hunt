package scene
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	
	public class YouLose extends Sprite
	{
		[Embed(source = "../../assets/duck.png", mimeType = "image/png")]
		private var YouLoseBitmap:Class;
		
		public function YouLose()
		{
			super();
			var myImage : Bitmap = new YouLoseBitmap();
			addChild( myImage );				
		}
	}
}