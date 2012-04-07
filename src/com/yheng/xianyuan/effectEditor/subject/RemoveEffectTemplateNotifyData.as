package com.yheng.xianyuan.effectEditor.subject
{
	import com.codeTooth.actionscript.patterns.subject.NotifyData;
	import com.yheng.xianyuan.effectEditor.data.EffectTemplateData;
	
	public class RemoveEffectTemplateNotifyData extends NotifyData
	{
		public var effectTemplateData:EffectTemplateData = null;
		
		public function RemoveEffectTemplateNotifyData(effectTemplateData:EffectTemplateData)
		{
			this.effectTemplateData = effectTemplateData;
		}
	}
}