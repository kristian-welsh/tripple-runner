package com {
	import flash.display.Sprite;
	
	public class Char extends Sprite {
		static private const CHAR_WIDTH:Number = 20;
		
		public function Char(x:Number, y:Number) {
			super();
			graphics.beginFill(0xFFFFFF);
			graphics.drawRect(0, 0, CHAR_WIDTH, CHAR_WIDTH);
			graphics.endFill();
			this.x = x;
			this.y = y - CHAR_WIDTH;
		}
	}
}