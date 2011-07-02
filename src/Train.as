package src 
{
	import flash.display.*;
	import flash.events.*;
	import flash.ui.*;
	import src.*;
	/**
	 * ...
	 * @author Aaron Golliver
	 */
	public class Train extends GlobalVariables
	{
		private var stageRef:Stage;
		public var groundRef:Ground
		private var chassis:Chassis;
		private var particlesPerPixel:Number;
		private var particles:Vector.<Particle>;
		private var key:KeyObject;
		private var jumpNum:Number;
		private var avgLineVisible:Boolean, exactLineVisible:Boolean, particleVisible:Boolean;
		private var avgLineColor:Number, exactLineColor:Number, particleColor:Number;
		private var avgLineAlpha:Number, exactLineAlpha:Number, particleAlpha:Number;
		var i;
		public function Train(stageRef:Stage, groundRef:Ground, carSize:Number = 3, particlesPerPixel_:Number = 4, avgLineVisible_:Boolean = true, exactLineVisible_:Boolean = true, particleVisible_:Boolean = true, avgLineColor_ = 0x000000, exactLineColor_ = 0x000000, particleColor_ = 0x000000, avgLineAlpha_ = 1, exactLineAlpha_ = 1, particleAlpha_ = .1)
		{
			super();
			this.stageRef = stageRef;
			key = new KeyObject(stageRef);
			this.groundRef = groundRef;
			particlesPerPixel = particlesPerPixel_;
			avgLineVisible = avgLineVisible_;
			exactLineVisible = exactLineVisible_;
			particleVisible = particleVisible_;
			avgLineColor = avgLineColor_;
			avgLineAlpha = avgLineAlpha_;
			exactLineColor = exactLineColor_;
			exactLineAlpha = exactLineAlpha_;
			particleColor = particleColor_;
			particleAlpha = particleAlpha_;
			
			particles = new Vector.<Particle>(particlesPerPixel*(StageWidth/carSize)); 			//Creates the line of particles which will work with the 1D physics engine
			
			for (i in particles) {
				particles[i] = new Particle(particleColor, particleAlpha,Math.random()+1);
				particles[i].finalX = i / particlesPerPixel;
				particles[i].x = 10 * StageWidth * Math.random() + StageWidth;
				particles[i].y = Math.random() * ((StageHeight / 3) *2);
				particles[i].vel.x = Math.random()*-1;
				particles[i].vel.y = 0;
				if (particleVisible) {
					addChild(particles[i]);
				}
				
			}
			addEventListener(Event.ENTER_FRAME, hitGround);
			addEventListener(Event.ENTER_FRAME, draw);
			//addEventListener(Event.ENTER_FRAME, keysPressed);
		}
		
		private function draw(e:Event) {
			graphics.clear();
			if(avgLineVisible){																								//There are usally more than one particle per x-axis cordinate, this averages all the ones on the same line and draws a line between them all
				graphics.lineStyle(30, avgLineColor, avgLineAlpha);
				graphics.moveTo(particles[0].x, particles[0].y);
				for (var i = 0; i < particles.length - particlesPerPixel; i += particlesPerPixel) {
					var tmpAvg:Number = 0;
					for (var ii = 0; ii < particlesPerPixel; ii++) {
						tmpAvg += particles[i + ii].y;
					}
					tmpAvg /= particlesPerPixel;
					graphics.lineTo(particles[i + particlesPerPixel].x, tmpAvg);
				}
			}
			if(exactLineVisible){																						//Draws a line between all the particles
				graphics.moveTo(particles[0].x, particles[0].y);
				graphics.lineStyle(10, exactLineColor, exactLineAlpha);
				for (i in particles) {
					graphics.lineTo(particles[i].x, particles[i].y);
				}
			}
		}
		
		private function hitGround(e:Event) {
			/*
			 * one dimensonal physics engline
			 */
			
			var tpos:PVector = null;
			
			for (i in particles) {
				var tcount = 0;
				
				if (!particles[i].active && particles[i].x < particles[i].finalX) {
					particles[i].active = true;
					//particles[i].snd.play();
					particles[i].change(2, .2);
					if (groundRef.hitTestPoint(x + particles[i].x, y + particles[i].y, true)) {
						tpos = new PVector(x + particles[i].x, y + particles[i].y);
						for (null; groundRef.hitTestPoint(tpos.x, tpos.y, true); tpos.y--) { tcount++ };		//figure out how many pixles deep it went
						particles[i].y -= tcount;
					}
					var starBurst:StarBurst = new StarBurst();
					starBurst.x = particles[i].x;
					starBurst.y = particles[i].y;
					addChild(starBurst);
				}
				
				if(groundRef.hitTestPoint(x + particles[i].x, y + particles[i].y, true) && particles[i].active){						//if the particle hits ground
					tpos = new PVector(x + particles[i].x, y + particles[i].y);
					for (null; groundRef.hitTestPoint(tpos.x, tpos.y, true); tpos.y--) { tcount++ };		//figure out how many pixles deep it went
					particles[i].y -= tcount;																					//place the particle above ground
					particles[i].acc.y = 0;																						//adjust speed and velocity
					if (particles[i].vel.y > 0) particles[i].vel.y *= -.1;
					if (particles[i].vel.y > 0) particles[i].vel.y = 0;
					particles[i].vel.y += -tcount / 10- Math.random()*(tcount/8);									//further adjust speed and velocity, adding randomness to make it so you don't have obvious lines of particles following the same path
				}		
			}
		}
		
		private function keysPressed(e:Event) {
			/*if (key.isDown(Keyboard.UP)) {
				var jumpFloat:JumpFloat = new JumpFloat(particles,particlesPerPixel);
			}
			if (key.isDown(Keyboard.SPACE)) {
				var jumpStd:JumpStd = new JumpStd(particles,particlesPerPixel);
			}
			if (key.isDown(Keyboard.SHIFT)) {
				var jumpLong:JumpLong = new JumpLong(particles,particlesPerPixel);
			}
			if (key.isDown(Keyboard.CONTROL)) {
				var jumpDrop:JumpDrop = new JumpDrop(particles,particlesPerPixel);
			}*/
		}
	}
}