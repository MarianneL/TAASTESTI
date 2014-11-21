package
{
	import flash.display.Stage;
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class Main extends MovieClip
	{
		public var level1:Level1;
		public var player:Player;
		
		public function Main()
		{
			level1 = new Level1(stage, 480, 370);
			stage.addChild(level1);
			
			player = new Player(stage, 140, 300);
			stage.addChild(player);
		}
	}
}