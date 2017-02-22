package scene
{
	import com.greensock.TweenLite;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class Dog extends Sprite
	{
		
		[Embed(source = "../../assets/dog.png", mimeType = "image/png")]
		private var DogImg:Class;
		private var myImage : Bitmap;
		
		public function Dog()
		{
			super();
			myImage = new DogImg();
			addChild( myImage );				
			
			myImage.x = (1280-myImage.width)/2;
			myImage.y = 720;
			
			addEventListener(Event.ADDED_TO_STAGE, appear);			
		}
		
		public function retreat():void {
			TweenLite.to(myImage, 0.5, {y:720});			
		}
		
		private function appear(e:Event):void 
		{
			TweenLite.to(myImage, 2, {y:(720-(myImage.height+100))});
			
		}
	}
}