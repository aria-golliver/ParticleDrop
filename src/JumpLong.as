package src 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	/**
	 * ...
	 * @author Aaron Golliver
	 */
	public class JumpLong extends MovieClip
	{
		private var jumpNum:Number;
		private var vec;
		private var perPixel:Number;
		
		public function JumpLong(vec_:Vector.<src.Particle>,perPixel_:Number = 3) 
		{
			vec = vec_;
			jumpNum = vec.length - 1;
			perPixel = perPixel_
			/*for (var i in vec) {
				vec[i].vel.y = -16;
			}*/
			
			addEventListener(Event.ENTER_FRAME, loop);
		}
		
		private function loop(e:Event) {
			for (var i = 0; i < 5 * perPixel; i++) {
				if(vec[i].active){
					if (jumpNum < 0) {
						removeEventListener(Event.ENTER_FRAME, loop);
					} else {
						if (vec[jumpNum].vel.y > 0) {
							vec[jumpNum].vel.y = 0;
						}
						
						vec[jumpNum].vel.y = -5;
						jumpNum--;
					}
				}
			}
		}
	}
}