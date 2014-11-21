package
{
	import KeyObject;
	
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.geom.Point;
	
	public class Player extends MovieClip
	{
		public var stageRef:Stage;
		public var key:KeyObject;
		
		public var leftPressed:Boolean = false;
		public var rightPressed:Boolean = false;
		
		//static  var leftBumpPoint:Point = new Point(-35, -45);
		//static var rightBumpPoint:Point = new Point(35, -45)
		
		var speed:Number = 5;
		
		var animationState:String = "idle";
		
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
			
			// Jos oikea näppäin pohjassa
			if(rightPressed)
			{
				// animaatioksi vaihtuu oikealle kävelevä ukkeli
				animationState = "walkRight";
				x += speed;
			}
			// Jos vasen näppäin on pohjassa...
			else if(leftPressed)
			{
				// animaatioksi vaihtuu vasemmalle kävelevä ukkeli
				animationState = "walkLeft";
				x -= speed;
			}
			// Jos kumpikaan näppäin ei ole pohjassa... (! = not, eli "not rightPressed")
			else if(!rightPressed && !leftPressed)
				//...animaationa on idle
				animationState = "idle";
			
			// currentLabel katsoo flashissä ukkelin timelinelta, missä labelissa ollaan (labelit: idle, walking.)
			// Jos label ja animaatio jonka pitäisi pyöriä ei täsmää, animaatio vaihdetaan oikeaksi
			// TAi jotain sellasta, en oikeen ymmäräny :D
			if(this.currentLabel != animationState)
				this.gotoAndStop(animationState);
			
			/*if(this.x < 38)
				this.x = 38;
			else if(this.x > 932)
				this.x = 923;*/
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