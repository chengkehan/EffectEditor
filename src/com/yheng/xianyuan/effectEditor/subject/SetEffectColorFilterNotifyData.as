package com.yheng.xianyuan.effectEditor.subject
{
	import com.codeTooth.actionscript.patterns.subject.NotifyData;
	import com.yheng.xianyuan.effectEditor.data.EffectData;
	
	public class SetEffectColorFilterNotifyData extends NotifyData
	{
		public var effect:EffectData = null;
		
		public function SetEffectColorFilterNotifyData(effect:EffectData)
		{
			this.effect = effect;
		}
	}
}