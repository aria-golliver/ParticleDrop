package src
{
	/**
	 * ...
	 * @author Aaron Golliver
	 */
	import flash.display.*;
	import flash.events.*;
	import flash.filters.*;
	import flash.ui.*;
	import src.starfield.*;

	public class Docclass extends GlobalVariables
	{
		private var key:KeyObject;
		private var ground:Ground;
		//private var glowing:Boolean = false;
		private var glowAmount:Number = 100;
		var alph:Number = .3
		public function Docclass() 
		{
			var bgmusic:backgroundMusicPlayer = new backgroundMusicPlayer();
			
			
			key = new KeyObject(stage);
			
			StageHeight = stage.stageHeight;
			StageWidth = stage.stageWidth;
			
			ground = new Ground(stage, 0x000000);
			var train:Train = new Train(stage, ground, 2.5, 6, false, false, true, 0x222222, 0x000011, 0xFFFFFF, 1, .8, .2);
			var titlecredits:TitleCredits  = new TitleCredits();
			titlecredits.y = StageHeight - titlecredits.height;
			train.x = 40;
			var starfield:StarField = new StarField(50, 1.5);
			//var moon:Moon = new Moon();
			//moon.x = 571.95;
			//moon.y = 70;
			//moon.scaleX = .8;
			//moon.scaleY = .8;
			addChild(starfield);
			addChild(train);
			//addChild(moon);
			addChild(ground);
			addChild(titlecredits);
			titlecredits.addEventListener(Event.ENTER_FRAME, fadeOut);
			//ground.filters = [new GlowFilter(0xFF0033, 1, glowAmount, glowAmount, alph, 1, false, false)];
			//moon.filters = [new GlowFilter(0xFFFFFF, 1, 38, 38, .1, 3,false,false)];
			//addEventListener(Event.ENTER_FRAME, keyPresses);
		}
		
		private function keyPresses(e:Event) {
			if (key.isDown(Keyboard.RIGHT)) {
				alph += .01
				ground.filters = [new GlowFilter(0xFF0033, 1, glowAmount, glowAmount, alph, 1, false, false)];
			} else if (key.isDown(Keyboard.LEFT) && alph > 0) {
				alph -= .01;
				ground.filters = [new GlowFilter(0xFF0033, 1, glowAmount, glowAmount, alph, 1, false, false)];
			} else if (alph <= 0) {
				ground.filters = null;
			}
		}
		
		private function fadeOut(e:Event) {
			if (e.target.alpha > 0) {
				e.target.alpha -= .01;
			} else {
				removeChild(e.target as DisplayObject);
				e.target.removeEventListener(Event.ENTER_FRAME, fadeOut);
			}
		}
	}

}