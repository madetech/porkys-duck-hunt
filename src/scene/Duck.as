package scene
{
	import flash.display.Bitmap;
	import flash.display.Sprite;

	public class Duck extends Sprite
	{
		[Embed(source = "../../assets/duck.png", mimeType = "image/png")]
		private var DuckImg:Class;
		
		public function Duck()
		{
			super();
			var myImage : Bitmap = new DuckImg();
			addChild( myImage );				
			
			myImage.x = (1280-myImage.width)/2;
			myImage.y = (720-myImage.height)/2;			
		}
	}
}