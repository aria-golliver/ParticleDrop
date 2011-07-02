package src 
{
	import flash.display.*;
	import flash.events.*;
	import src.*;
	/**
	 * ...
	 * @author Aaron Golliver
	 */
	public class Particle extends PObject
	{
		private var pcolor:Number, palpha:Number;
		public var finalX:Number;
		//public var snd:Sound;
		
		public function Particle(pcolor_:Number = 0x000000, palpha_:Number = .1, pradius_:Number = 3) 
		{
			super();
			active = false;
			friction = new PVector(0.0, .98);
			gravity = new PVector(0, .05);
			pcolor = pcolor_;
			palpha = palpha_;
			
			graphics.beginFill(pcolor,palpha);
			graphics.drawCircle(0, 0, pradius_);
			/*var tmp:Number = Math.round(Math.random() * 2);
			if (tmp == 0) {
				snd = new drip0();
			} else if (tmp == 1) {
				snd = new drip1();
			} else {
				snd = new drip1();
			}*/
			//snd = new drip0();
		}
		public function change(_radius:Number, _alpha:Number) {
			graphics.clear();
			graphics.beginFill(0xFFFFFF, _alpha);
			graphics.drawCircle(0, 0, _radius);
			graphics.endFill();
		}
	}
}