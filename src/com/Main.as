package com {
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.events.KeyboardEvent;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
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
		
		private var liveChars:int = 3;
		private var score:int = 0;
		
		private var scoreDisplay:TextField;
		
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
			initScoreDisplay();
			addChildren();
			
			var timer:Timer = new Timer(1);
			
			stage.addEventListener(KeyboardEvent.KEY_UP, handleKeyUp);
			timer.addEventListener(TimerEvent.TIMER, tick);
			
			timer.start();
		}
		
		private function initScoreDisplay():void {
			scoreDisplay = new TextField();
			scoreDisplay.x = Globals.STAGE_WIDTH / 2 - 40;
			scoreDisplay.y = 10;
			scoreDisplay.type = TextFieldType.DYNAMIC;
			//scoreDisplay.textColor = ;
			
			var format:TextFormat = new TextFormat("Arial Black", 40, 0xFFFFFF);
			scoreDisplay.defaultTextFormat = format;
			
			scoreDisplay.appendText("0");
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
			
			char1.addEventListener("DIE", killChar);
			char2.addEventListener("DIE", killChar);
			char3.addEventListener("DIE", killChar);
		}
		
		private function initObstacles():void {
			obstacle1 = new Obstacle(1, char1);
			obstacle2 = new Obstacle(2, char2);
			obstacle3 = new Obstacle(3, char3);
			
			obstacle1.addEventListener("SCORE", scorePoint);
			obstacle2.addEventListener("SCORE", scorePoint);
			obstacle3.addEventListener("SCORE", scorePoint);
		}
		
		private function addChildren():void {
			stage.addChild(obstacle1);
			stage.addChild(obstacle2);
			stage.addChild(obstacle3);
			
			stage.addChild(char1);
			stage.addChild(char2);
			stage.addChild(char3);
			
			stage.addChild(scoreDisplay);
		}
		
		private function killChar(e:Event):void {
			liveChars--;
		}
		
		private function scorePoint(e:Event = null):void {
			score += liveChars;
			scoreDisplay.text = ""+score;
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
			obstacle1.tick();
			obstacle2.tick();
			obstacle3.tick();
		}
	}
}