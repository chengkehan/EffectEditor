package com.yheng.xianyuan.effectEditor.command
{
	public class AddEffectCommandData
	{
		public var effectTemplateID:Number = 0;
		
		public var effectID:Number = 0;
		
		public var origionX:int = 0;
		
		public var origionY:int = 0;
		
		public var prefix:int = 0;
		
		public var suffix:int = 0;
		
		public function AddEffectCommandData(effectTemplateID:Number, effectID:Number, origionX:int, origionY:int, prefix:int, suffix:int = 0)
		{
			this.effectTemplateID = effectTemplateID;
			this.effectID = effectID;
			this.origionX = origionX;
			this.origionY = origionY;
			this.prefix = prefix;
			this.suffix = suffix;
		}
	}
}