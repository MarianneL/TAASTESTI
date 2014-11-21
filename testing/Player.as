package
{
	import KeyObject;
	
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	
	public class Player extends MovieClip
	{
		public var stageRef:Stage;
		public var key:KeyObject;
		
		public var leftPressed:Boolean = false;
		public var rightPressed:Boolean = false;
		
		var speed:Number = 5;
		
		public function Player(stageRef:Stage, X:int, Y:int):void
		{
			this.stageRef = stageRef;
			this.x = X;
			this.y = Y;
			
			key = new KeyObject(stageRef);
			
			addEventListener(Event.ENTER_FRAME, loop, false, 0, true);
		}
		
		public function loop(e:Event):void
		{
			checkKeypresses();
			
			if(leftPressed)
			{
				x -= speed;
			} else if(rightPressed)
			{
				x += speed;
			}
		}
		
		public function checkKeypresses():void
		{
			if(key.isDown(37) || key.isDown(65)){ 
				leftPressed = true;
			} else {
				leftPressed = false;
			}
			
			if(key.isDown(39) || key.isDown(68)){ 
				rightPressed = true;
			} else {
				rightPressed = false;
			}
		}
		
	}
}