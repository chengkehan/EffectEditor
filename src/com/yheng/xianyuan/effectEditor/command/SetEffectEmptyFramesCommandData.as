package com.yheng.xianyuan.effectEditor.command
{
	public class SetEffectEmptyFramesCommandData
	{
		public var effectID:Number = 0;
		
		public var prefix:int = 0;
		
		public var suffix:int = 0;
		
		public function SetEffectEmptyFramesCommandData(effectID:Number, prefix:int, suffix:int)
		{
			this.effectID = effectID;
			this.prefix = prefix;
			this.suffix = suffix;
		}
	}
}