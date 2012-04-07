package com.yheng.xianyuan.effectEditor.command
{
	public class SetEffectOrigionCommandData
	{
		public var effectID:Number = 0;
		
		public var origionX:int = 0;
		
		public var origionY:int = 0;
		
		public function SetEffectOrigionCommandData(effectID:Number, origionX:int, origionY:int)
		{
			this.effectID = effectID;
			this.origionX = origionX;
			this.origionY = origionY;
		}
	}
}