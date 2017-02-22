package scene
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	
	public class YouLose extends Sprite
	{
		[Embed(source = "../../assets/game_over.png", mimeType = "image/png")]
		private var YouLoseBitmap:Class;
		
		public function YouLose()
		{
			super();
			
			var myImage : Bitmap = new YouLoseBitmap();
			addChild( myImage );
			
			myImage.x = (1280-myImage.width)/2;
			myImage.y = (720-myImage.height)/2;
		}
	}
}