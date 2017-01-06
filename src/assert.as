package {
	public function assert(condition:Boolean):void {
		if (!condition)
			throw new Error("Assertion failed");
	}
}