package {
	import org.flashdevelop.utils.FlashConnect;
	
	public function print(out:Object):void {
		FlashConnect.trace(out.toString());
	}
}