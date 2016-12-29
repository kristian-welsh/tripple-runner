package com {
	import flash.display.Sprite;
	
	public class Char extends Sprite {
		static private const GRAVITY:Number = 1;
		static private const CHAR_WIDTH:Number = 20;
		
		private var groundPos:Number;
		private var jumping:Boolean = false;
		private var velocity:Number = 0;
		
		public function Char(x:Number, y:Number) {
			super();
			graphics.beginFill(0xFFFFFF);
			graphics.drawRect(0, 0, CHAR_WIDTH, CHAR_WIDTH);
			graphics.endFill();
			this.x = x;
			this.y = y - CHAR_WIDTH;
			groundPos = y;
		}
		
		public function jump():void {
			if(!jumping) {
				jumping = true;
				velocity = -15;
				groundPos = y;
			}
		}
		
		public function tick():void {
			if(jumping) {
				velocity += GRAVITY;
				y += velocity;
				if (y >= groundPos) {
					y = groundPos
					jumping = false;
				}
			}
		}
	}
}