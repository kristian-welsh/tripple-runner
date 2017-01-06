package com {
	import assert;
	import flash.display.Sprite;
	
	public class Obstacle extends Sprite {
		private static const WIDTH:Number = 30;
		private static const HEIGHT:Number = 20;
		
		public function Obstacle(lane:int) {
			assert(1 <= lane && lane <= 3);
			
			this.x = Globals.STAGE_WIDTH - WIDTH;
			this.y = lane * Globals.STAGE_HEIGHT / 3 - HEIGHT;
			
			graphics.beginFill(0xFFFFFF);
			graphics.drawRect(0, 0, WIDTH, HEIGHT);
			graphics.endFill();
		}
	}
}