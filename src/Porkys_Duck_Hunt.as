package
{
	import flash.display.Sprite;
	
	import scene.Background;
	
	public class Porkys_Duck_Hunt extends Sprite
	{
		private var background:Background;
		private var duck:Background;	
		private var dog:Background;
		private var connection:PorkySocket;
		
		public function Porkys_Duck_Hunt()
		{
			background = new Background();
			duck = new Background();	
			dog = new Background();
			connection = new PorkySocket()
			connection.addEventListener(PorkyEvent.DUCK_HIT, duckHit);
		}
		
		private function duckHit( e:PorkyEvent ) 
		{
			trace('DUCK HIT');	
		}
	}
}