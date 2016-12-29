package com{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.TimerEvent;
	
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
			initChars();
			
			stage.addEventListener(KeyboardEvent.KEY_UP, handleKeyUp);
			stage.addEventListener(TimerEvent.TIMER, tick);
		}
		
		private function drawSeperators():void {
			graphics.beginFill(0xFFFFFF);
			graphics.drawRect(0, 1 * stage.stageHeight / 3 - 10, stage.stageWidth, 10);
			graphics.drawRect(0, 2 * stage.stageHeight / 3 - 10, stage.stageWidth, 10);
			graphics.drawRect(0, 3 * stage.stageHeight / 3 - 10, stage.stageWidth, 10);
			graphics.endFill();
		}
		
		private function initChars():void {
			char1 = new Char(10, 1 * stage.stageHeight / 3 - 10);
			char2 = new Char(10, 2 * stage.stageHeight / 3 - 10);
			char3 = new Char(10, 3 * stage.stageHeight / 3 - 10);
			
			stage.addChild(char1);
			stage.addChild(char2);
			stage.addChild(char3);
		}
		
		private function handleKeyUp(e:KeyboardEvent):void {
			switch(e.keyCode) {
				case 90:
					jump(char1);
					break;
				case 88:
					jump(char2);
					break;
				case 67:
					jump(char3);
					break;
			}
		}
		
		private function jump(char:Sprite):void {
			
		}
		
		private function tick(e:TimerEvent):void {
			
		}
	}
}