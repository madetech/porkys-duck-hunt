package scene
{
	import flash.display.Sprite;
	
	public class Background extends Sprite
	{
		[Embed(source = "../../assets/landscape.png", mimeType = "image/png")]
		private var BackgroundImg:Class;
		
		public function Background()
		{
			addChild(new BackgroundImg());	
		}
	}
}