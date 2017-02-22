package scene
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	
	public class Dog extends Sprite
	{
		
		[Embed(source = "../../assets/dog.png", mimeType = "image/png")]
		private var DogImg:Class;
		
		public function Dog()
		{
			super();
			var myImage : Bitmap = new DogImg();
			addChild( myImage );				
			
			myImage.x = (1280-myImage.width)/2;
			myImage.y = (720-myImage.height);			
			
		}
	}
}