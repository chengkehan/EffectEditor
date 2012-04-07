package com.yheng.xianyuan.effectEditor.subject
{
	import com.codeTooth.actionscript.patterns.subject.NotifyData;
	import com.yheng.xianyuan.effectEditor.data.EffectData;
	
	public class AddEffectNotifyData extends NotifyData
	{
		public var effectData:EffectData = null;
		
		public function AddEffectNotifyData(effectData:EffectData)
		{
			this.effectData = effectData;
		}
	}
}