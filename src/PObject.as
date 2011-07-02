package src 
{
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	/**
	 * ...
	 * @author Aaron Golliver
	 */
	public class PObject extends GlobalVariables
	{
		public var acc:PVector = new PVector();
		public var vel:PVector = new PVector();
		public var gravity:PVector = new PVector();
		public var friction:PVector = new PVector(1, 1);
		public var active:Boolean = true;
		
		public function PObject() 
		{
			addEventListener(Event.ENTER_FRAME, movement);
		}
		private function movement(e:Event) {
			if(active){
				acc.add(gravity);
				vel.add(acc);
				vel.mul(friction);
			}
			x += vel.x;
			y += vel.y;
		}
	}
}