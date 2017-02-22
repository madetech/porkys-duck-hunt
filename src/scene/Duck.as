package scene
{
	import com.greensock.TweenLite;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class Duck extends Sprite
	{
		[Embed(source = "../../assets/duck.png", mimeType = "image/png")]
		private var DuckImg:Class;
		private var myImage:Bitmap;
		private var flight:TweenLite;
		
		public function Duck()
		{
			super();
			myImage = new DuckImg();
			addChild( myImage );				
			
			myImage.x = 1280;
			myImage.y = (720-myImage.height)/2;		
						
			addEventListener(Event.ADDED_TO_STAGE, fly);
		}
		
		public function kill():void {
			flight.pause();
			TweenLite.to(myImage, 0.5, {y:720});
		}
		
		private function fly(e:Event):void {
			flight = TweenLite.to(myImage, 2, {x:-myImage.width});
		}		
	}
}