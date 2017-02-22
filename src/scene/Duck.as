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

		[Embed(source = "../../assets/dead_duck.png", mimeType = "image/png")]
		private var DeadDuckImg:Class;
		
		private var duckImage:Bitmap;
		private var deadDuckImage:Bitmap;		
		private var flight:TweenLite;
		private var duckContainer:Sprite;
		
		public function Duck()
		{
			super();
			duckContainer = new Sprite();
			addChild(duckContainer);
			
			duckImage = new DuckImg();
			duckContainer.addChild( duckImage );				
			
			duckContainer.x = 1280;
			duckContainer.y = randomBetween(20, 470);
						
			addEventListener(Event.ADDED_TO_STAGE, fly);
		}
		
		private function randomBetween(minNum:int, maxNum:int):int {
			return (Math.floor(Math.random() * (maxNum - minNum + 1)) + minNum);
		}
		
		public function kill():void {
			flight.pause();
			
			for(var i:int = 0; i < duckContainer.numChildren; i++) {
				duckContainer.removeChildAt(i)
			}
			
			deadDuckImage = new DeadDuckImg();
			duckContainer.addChild( deadDuckImage );	
			
			TweenLite.to(duckContainer, 0.5, {y:720});
		}
		
		private function fly(e:Event):void {
			flight = TweenLite.to(duckContainer, 10, {x:-200});
		}		
	}
}