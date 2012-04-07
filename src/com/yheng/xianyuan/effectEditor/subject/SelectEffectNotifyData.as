package com.yheng.xianyuan.effectEditor.subject
{
	import com.codeTooth.actionscript.patterns.subject.NotifyData;
	
	public class SelectEffectNotifyData extends NotifyData
	{
		public var effectID:Number = 0;
		
		public function SelectEffectNotifyData(effectID:Number)
		{
			this.effectID = effectID;
		}
	}
}