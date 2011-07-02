package src 
{
	import flash.display.*;
	import flash.events.*;
	import flash.ui.*;
	/**
	 * ...
	 * @author Aaron Golliver
	 */
	public class Ground extends PObject
	{		
		
		private var key:KeyObject;
		private var stageRef:Stage;
		private var hei:Number = 130;
		private var wid:Number = 130;
		private var posArray:Vector.<Number> = new Vector.<Number>(1.6*(StageWidth + 2) / wid);
		private var movArray:Vector.<Number> = new Vector.<Number>(1.6*(StageWidth + 2) / wid);
		private var i;
		private var totalGroundAdditions = 0;
		private var color:Number = 0x000066;
		public function Ground(stageRef:Stage, color_:Number = 0x000066) 
		{
			super();
			//friction.x = .98;
			this.stageRef = stageRef;
			this.color = color_;
			key = new KeyObject(stageRef);
			//graphics.beginFill(0x000066);
			//graphics.beginFill(0x6978CD, 1);
			graphics.moveTo(0, StageHeight / 2);
			
			for (i in posArray) {
				posArray[i] = Math.random() * hei + StageHeight / 2;
				//posArray[i] = StageHeight-100;
				if (Math.random() * 10 > 5) {
				//	movArray[i] =  Math.random() * 1.7;
					movArray[i] = 0;
				} else {
				//	movArray[i] = -Math.random() * 1.3;
					movArray[i] = 0;
				}
			}
			
			//addEventListener(Event.ENTER_FRAME, keysPressed);
			addEventListener(Event.ENTER_FRAME, draw);
			vel.x = -5;

		}
		
		private function draw(e:Event) {
			
			if (x < -2*wid) {																				//if the level is too far to the left
				x = -wid + vel.x;																					//reset level position
				
				if (totalGroundAdditions <= 30) {
					posArray.splice(0, 1);
					//posArray.push(StageHeight-100);
					posArray.push( Math.random() * hei + StageHeight / 2);
					movArray.splice(0, 1);
					movArray.push(0);
				} else {
					posArray.splice(0, 1);
					posArray.push(Math.random() * hei + ((StageHeight / 4) * 3));		//adds the next position to be drawn
					movArray.splice(0, 1);
					var tmp:Number = Math.random() * 10;
					if (tmp<3) {
						movArray.push( -Math.random() * 1.7);	
					} else if (tmp <6) {
						movArray.push( -Math.random() * 1.3);
					} else {
						movArray.push(0);
					}
				}
				totalGroundAdditions++;																//totalGroundAdditions is a counter of how many times this has happened. it is used when drawing the ground inorder to calculate the right drawing algorithm
			}
			
			graphics.clear();
			graphics.beginFill(color, 1);
			graphics.moveTo( -100, StageHeight/2);
			for (var i in posArray) {
				try {
					if (posArray[i] < StageHeight - 20) {
						posArray[i] += movArray[i];
					} else {
						posArray[i] = StageHeight - 20;
					}
					
					if ((i + totalGroundAdditions) % 2 == 0) {
						graphics.curveTo(i * wid, posArray[i - 1], i * wid, posArray[i]);
					} else {
						graphics.curveTo((i - 1) * wid, posArray[i], i * wid, posArray[i]);
					}
					
				} catch (error:Error) { }
			}
			graphics.lineTo(i * wid, StageHeight + 20);
			graphics.lineTo( -20, StageHeight + 20);
			graphics.endFill();
		}
		
		private function keysPressed(e:Event) {
			/*if (key.isDown(Keyboard.RIGHT)){
				acc.x = -.2;
			} else if (key.isDown(Keyboard.LEFT)) {
				acc.x = .2;
			} else {
				acc.x = 0;
			}*/
		}
	}

}