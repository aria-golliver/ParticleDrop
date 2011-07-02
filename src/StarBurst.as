package src 
{
	import flash.display.*;
	import flash.events.*;
	import flash.media.*;
	/**
	 * ...
	 * @author Aaron Golliver
	 */
	public class StarBurst extends MovieClip
	{
		
		public function StarBurst() 
		{
			addEventListener(Event.ENTER_FRAME, remove);
			var s:Sound = new drip0();
			s.play(0, 0, null);
		}
		
		private function remove(e:Event) {
			if (currentFrame >= 10) {
				stop();
				this.alpha = 0.0;
				//parent.removeChild(this);
				delete(this);
			}
		}
	}

}