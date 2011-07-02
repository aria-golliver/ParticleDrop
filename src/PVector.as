package src
{
	/**
	 * ...
	 * @author Aaron Golliver
	 */
	public class PVector 
	{
		public var x:Number;
		public var y:Number;
		
		public function PVector(tx:Number = 0, ty:Number = 0) 
		{
			x = tx;
			y = ty;
		}
		
		public function add(t:PVector):void {
			x += t.x;
			y += t.y;
		}
		
		public function mul(t:PVector):void {
			x *= t.x;
			y *= t.y;
		}
		
		public function sub(t:PVector):void {
			x -= t.x;
			y -= t.y;
		}
		public function div(t:PVector):void {
			x /= t.x;
			y /= t.y;
		}
	}
}