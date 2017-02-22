package scene
{
	import flash.display.Sprite;
	
	public class Dog extends Sprite
	{
		
		[Embed(source = "../../assets/dog.png", mimeType = "image/png")]
		private var DogImg:Class;
		
		public function Dog()
		{
			super();
			addChild(new DogImg());	
		}
	}
}