package com.yheng.xianyuan.effectEditor.command
{
	import com.codeTooth.actionscript.command.ICommand;
	import com.codeTooth.actionscript.lang.exceptions.NoSuchObjectException;
	import com.codeTooth.actionscript.lang.utils.Assert;
	import com.yheng.xianyuan.effectEditor.core.Mediator;
	import com.yheng.xianyuan.effectEditor.core.effectEditor_internal;
	import com.yheng.xianyuan.effectEditor.data.EffectTemplateData;
	
	public class GetEffectTemplateCommand implements ICommand
	{
		public function GetEffectTemplateCommand()
		{
		}
		
		public function execute(data:Object=null):*
		{
			Assert.checkNull(data);
			
			var input:GetEffectTemplateCommandData = GetEffectTemplateCommandData(data);
			var effectTemplatesData:Vector.<EffectTemplateData> = Mediator.data.effectEditor_internal::getEffectTemplatesData();
			for each(var effectTemplateData:EffectTemplateData in effectTemplatesData)
			{
				if(effectTemplateData.id == input.effectTemplateID)
				{
					return effectTemplateData;
				}
			}
			
			throw new NoSuchObjectException("Cannot find the effectTemplateDataID \"" + input.effectTemplateID + "\"");
			return null;
		}
	}
}