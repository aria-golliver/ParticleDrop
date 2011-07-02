package src 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	/**
	 * ...
	 * @author Aaron Golliver
	 */
	public class JumpFloat extends MovieClip
	{
		private var jumpNum:Number;
		private var vec;
		private var perPixel:Number
		
		public function JumpFloat(vec_:Vector.<src.Particle>,perPixel_:Number = 3) 
		{
			vec = vec_;
			jumpNum = vec.length - 1;
			perPixel = perPixel_
			addEventListener(Event.ENTER_FRAME, loop);
		}
		
		private function loop(e:Event) {
			for (var i = 0; i < 5 * perPixel; i++) {
				if(vec[i].active){
					if (jumpNum < 0) {
						removeEventListener(Event.ENTER_FRAME, loop);
						delete(this);
					} else {
						//if (vec[jumpNum].vel.y > 0) vec[jumpNum].vel.y = 0;
						vec[jumpNum].acc.y = 0;
						vec[jumpNum].vel.y += -1;
						jumpNum--;
					}
				}
			}
		}
	}
}