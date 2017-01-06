package com {
	import flash.display.Sprite;
	import flash.display3D.textures.RectangleTexture;
	import flash.events.Event;
	import flash.geom.Rectangle;
	
	public class Obstacle extends Sprite {
		private static const WIDTH:Number = 60;
		private static const HEIGHT:Number = 30;
		
		private var speed:Number;
		
		private var char:Char;
		
		public function Obstacle(lane:Number, char:Char) {
			assert(1 <= lane && lane <= 3);
			
			x = Globals.STAGE_WIDTH;
			y = lane * Globals.STAGE_HEIGHT / 3 - HEIGHT - Globals.DIVIDER_WIDTH;
			speed = randomBoundedNum(5, 8)
			this.char = char;
			
			draw();
		}
		
		private function draw():void {
			graphics.beginFill(0xFFFFFF);
			graphics.drawRect(0, 0, WIDTH, HEIGHT);
			graphics.endFill();
		}
		
		public function tick():void {
			this.x -= speed;
			if (this.x + WIDTH < 0) {
				this.x = Globals.STAGE_WIDTH;
				speed = randomBoundedNum(5, 10);
				dispatchEvent(new Event("SCORE"));
			}
			collide();
		}
		
		private function collide():void {
			var thisCollider:Rectangle = this.getBounds(this.parent);
			var charCollider:Rectangle = char.getBounds(char.parent);
			if (thisCollider.left <= charCollider.right && thisCollider.right >= charCollider.left && charCollider.bottom >= thisCollider.bottom) {
				if(speed != 0) {
					char.kill();
				}
				speed = 0;
			}
		}
		
		private function randomBoundedNum(low:Number, high:Number):Number {
			return Math.random() * (high - low) + low;
		}
		
		public function reset():void {
			this.x = Globals.STAGE_WIDTH;
			speed = randomBoundedNum(5, 10);
		}
	}
}