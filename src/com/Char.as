package com {
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class Char extends Sprite {
		static private const GRAVITY:Number = 1;
		static private const CHAR_WIDTH:Number = 20;
		
		private var groundPos:Number;
		private var living:Boolean = true;
		private var jumping:Boolean = false;
		private var velocity:Number = 0;
		
		public function Char(x:Number, y:Number) {
			super();
			draw(0xFFFFFF);
			this.x = x;
			this.y = y - CHAR_WIDTH;
			groundPos = y;
		}
		
		private function draw(colour:Number):void {
			graphics.beginFill(colour);
			graphics.drawRect(0, 0, CHAR_WIDTH, CHAR_WIDTH);
			graphics.endFill();
		}
		
		public function jump():void {
			if(!jumping && living) {
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
		
		public function kill():void {
			graphics.clear();
			draw(0xCC0000);
			jumping = false;
			living = false;
			dispatchEvent(new Event("DIE"));
		}
	}
}