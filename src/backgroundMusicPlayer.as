package src 
{
	import flash.display.*;
	import flash.media.*;
	/**
	 * ...
	 * @author Aaron Golliver
	 */
	public class backgroundMusicPlayer extends MovieClip 
	{
		
		private var music:Sound;
		
		public function backgroundMusicPlayer() 
		{
			music = new BG1();
			music.play(0, 99, null);
		}
		
	}

}