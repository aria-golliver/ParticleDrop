package src.starfield 
{
	import flash.events.*;
	import src.*;
	/**
	 * ...
	 * @author Aaron Golliver
	 */
	public class StarField extends GlobalVariables
	{
		
		private var starField:Vector.<Star>;
		private var maxStarRadius:Number;
		
		public function StarField(_totalStars:Number = 100, _maxStarRadius:Number = 3) 
		{
			starField = new Vector.<Star>(_totalStars);
			maxStarRadius = _maxStarRadius;
			
			for (var i in starField) {
				starField[i] = new Star(_maxStarRadius);
				starField[i].y = Math.random() * StageHeight;
				starField[i].x = 1.2*StageWidth*Math.random();
				addChild(starField[i]);
			}
			
			addEventListener(Event.ENTER_FRAME, starControl);
		}
		
		private function starControl(e:Event) {
			for (var i in starField) {
				if ( starField[i].x < -maxStarRadius) {
					//removeChild(starField[i])
					//delete(starField[i]);
					starField[i].x = StageWidth + StageWidth * Math.random() * 2;
					starField[i].y = StageHeight * Math.random();
				}
			}
		}
	}
}