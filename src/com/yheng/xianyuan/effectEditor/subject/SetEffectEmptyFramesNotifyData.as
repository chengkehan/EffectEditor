package com.yheng.xianyuan.effectEditor.subject
{
	import com.codeTooth.actionscript.patterns.subject.NotifyData;
	import com.yheng.xianyuan.effectEditor.data.EffectData;
	
	public class SetEffectEmptyFramesNotifyData extends NotifyData
	{
		public var effectData:EffectData = null;
		
		public function SetEffectEmptyFramesNotifyData(effectData:EffectData)
		{
			this.effectData = effectData;
		}
	}
}