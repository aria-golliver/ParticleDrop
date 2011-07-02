package src.starfield 
{
	import src.*;
	/**
	 * ...
	 * @author Aaron Golliver
	 */
	public class Star extends PObject
	{
		
		public function Star(_maxRadius:Number = 3) 
		{
			super();
			vel.x = Math.random()*-.5 - .1;
			graphics.beginFill(0xFFFFFF, Math.random()*.2);
			graphics.drawCircle(0, 0, Math.random() * _maxRadius + 1);
			graphics.endFill();
		}
		
	}

}