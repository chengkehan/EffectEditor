package com.yheng.xianyuan.effectEditor.command
{
	public class SetEffectColorFilterCommandData
	{
		public var effectID:Number = 0;
		
		public var v1:Number = 0;
		public var v2:Number = 0;
		public var v3:Number = 0;
		public var v4:Number = 0;
		
		public function SetEffectColorFilterCommandData(effectID:Number, v1:Number, v2:Number, v3:Number, v4:Number)
		{
			this.effectID = effectID;
			this.v1 = v1;
			this.v2 = v2;
			this.v3 = v3;
			this.v4 = v4;
		}
	}
}