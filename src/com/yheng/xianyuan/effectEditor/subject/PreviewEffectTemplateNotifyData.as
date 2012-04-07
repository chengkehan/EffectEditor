package com.yheng.xianyuan.effectEditor.subject
{
	import com.codeTooth.actionscript.patterns.subject.NotifyData;
	
	public class PreviewEffectTemplateNotifyData extends NotifyData
	{
		public var effectTemplateID:Number = 0;
		
		public function PreviewEffectTemplateNotifyData(effectTemplateID:Number)
		{
			this.effectTemplateID = effectTemplateID;
		}
	}
}