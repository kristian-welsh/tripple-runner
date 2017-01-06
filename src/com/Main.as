package com{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.TimerEvent;
	import flash.sampler.NewObjectSample;
	import flash.utils.Timer;
	
	public class Main extends Sprite {
		
		private var char1:Char;
		private var char2:Char;
		private var char3:Char;
		
		private var obstacle1:Obstacle;
		private var obstacle2:Obstacle;
		private var obstacle3:Obstacle;
		
		private var jumping:Boolean = false;
		
		private var vel:Number = 0;
		private var groundPos:Number;
		
		public function Main() {
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void {
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			Globals.STAGE_HEIGHT = stage.stageHeight;
			Globals.STAGE_WIDTH = stage.stageWidth;
			
			drawSeperators();
			initChars();
			initObstacles();
			
			var timer:Timer = new Timer(1);
			
			stage.addEventListener(KeyboardEvent.KEY_UP, handleKeyUp);
			timer.addEventListener(TimerEvent.TIMER, tick);
			
			timer.start();
		}
		
		private function drawSeperators():void {
			graphics.beginFill(0xFFFFFF);
			graphics.drawRect(0, 1 * stage.stageHeight / 3 - Globals.DIVIDER_WIDTH, stage.stageWidth, Globals.DIVIDER_WIDTH);
			graphics.drawRect(0, 2 * stage.stageHeight / 3 - Globals.DIVIDER_WIDTH, stage.stageWidth, Globals.DIVIDER_WIDTH);
			graphics.drawRect(0, 3 * stage.stageHeight / 3 - Globals.DIVIDER_WIDTH, stage.stageWidth, Globals.DIVIDER_WIDTH);
			graphics.endFill();
		}
		
		private function initChars():void {
			char1 = new Char(10, 1 * stage.stageHeight / 3 - Globals.DIVIDER_WIDTH);
			char2 = new Char(10, 2 * stage.stageHeight / 3 - Globals.DIVIDER_WIDTH);
			char3 = new Char(10, 3 * stage.stageHeight / 3 - Globals.DIVIDER_WIDTH);
			
			stage.addChild(char1);
			stage.addChild(char2);
			stage.addChild(char3);
		}
		
		private function initObstacles():void {
			obstacle1 = new Obstacle(1);
			obstacle2 = new Obstacle(2);
			obstacle3 = new Obstacle(3);
			
			stage.addChild(obstacle1);
			stage.addChild(obstacle2);
			stage.addChild(obstacle3);
		}
		
		private function handleKeyUp(e:KeyboardEvent):void {
			switch(e.keyCode) {
				case 90:
					char1.jump();
					break;
				case 88:
					char2.jump();
					break;
				case 67:
					char3.jump();
					break;
			}
		}
		
		private function tick(e:TimerEvent):void {
			char1.tick();
			char2.tick();
			char3.tick();
		}
	}
}