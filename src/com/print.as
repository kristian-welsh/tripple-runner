package com {
	import org.flashdevelop.utils.FlashConnect;
	
	function print(out:Object):void {
		FlashConnect.trace(out.toString());
	}
}