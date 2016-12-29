package com{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class Main extends Sprite {
		
		static private const CHAR_WIDTH:Number = 20;
		
		private var char1:Sprite;
		private var char2:Sprite;
		private var char3:Sprite;
		
		public function Main() {
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void {
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			drawSeperators();
			drawChars();
		}
		
		private function drawSeperators():void {
			graphics.beginFill(0xFFFFFF);
			graphics.drawRect(0, stage.stageHeight / 3, stage.stageWidth, 10);
			graphics.drawRect(0, 2 * stage.stageHeight / 3, stage.stageWidth, 10);
			graphics.endFill();
		}
		
		private function drawChars():void {
			char1 = new MovieClip();
			char2 = new MovieClip();
			char3 = new MovieClip();
			
			drawChar(10, 1 * stage.stageHeight / 3 - CHAR_WIDTH, char1);
			drawChar(10, 2 * stage.stageHeight / 3 - CHAR_WIDTH, char2);
			drawChar(10, 3 * stage.stageHeight / 3 - CHAR_WIDTH, char3);
			
			stage.addChild(char1);
			stage.addChild(char2);
			stage.addChild(char3);
		}
		
		private function drawChar(x:Number, y:Number, ref:Sprite):void {
			ref.graphics.beginFill(0xFFFFFF);
			ref.graphics.drawRect(0, 0, CHAR_WIDTH, CHAR_WIDTH);
			ref.graphics.endFill();
			ref.x = x;
			ref.y = y;
			stage.addChild(ref);
		}
	}
}