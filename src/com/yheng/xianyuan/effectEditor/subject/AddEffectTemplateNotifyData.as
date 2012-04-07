package com.yheng.xianyuan.effectEditor.subject
{
	import com.codeTooth.actionscript.patterns.subject.NotifyData;
	import com.yheng.xianyuan.effectEditor.data.EffectTemplateData;
	
	public class AddEffectTemplateNotifyData extends NotifyData
	{
		public var effectTemplateData:EffectTemplateData = null;
		
		public function AddEffectTemplateNotifyData(effectTemplateData:EffectTemplateData)
		{
			this.effectTemplateData = effectTemplateData;
		}
	}
}