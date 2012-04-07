package com.yheng.xianyuan.effectEditor.command
{
	import com.codeTooth.actionscript.command.ICommand;
	import com.codeTooth.actionscript.lang.utils.Assert;
	import com.yheng.xianyuan.effectEditor.core.Mediator;
	import com.yheng.xianyuan.effectEditor.core.effectEditor_internal;
	import com.yheng.xianyuan.effectEditor.data.EffectTemplateData;
	
	public class ContainsEffectTemplateCommand implements ICommand
	{
		public function ContainsEffectTemplateCommand()
		{
		}
		
		public function execute(data:Object=null):*
		{
			Assert.checkNull(data);
			
			var input:ContainsEffectTemplateCommandData = ContainsEffectTemplateCommandData(data);
			var effectTemplates:Vector.<EffectTemplateData> = Mediator.data.effectEditor_internal::getEffectTemplatesData();
			for each (var effectTemplate:EffectTemplateData in effectTemplates) 
			{
				if(effectTemplate.id == input.effectTemplateID)
				{
					return true;
				}
			}
			
			return false;
		}
	}
}