package com.yheng.xianyuan.effectEditor.command
{
	import com.codeTooth.actionscript.command.ICommand;
	import com.codeTooth.actionscript.lang.exceptions.NoSuchObjectException;
	import com.codeTooth.actionscript.lang.utils.Assert;
	import com.yheng.xianyuan.effectEditor.core.Mediator;
	import com.yheng.xianyuan.effectEditor.core.effectEditor_internal;
	import com.yheng.xianyuan.effectEditor.data.EffectData;
	import com.yheng.xianyuan.effectEditor.data.EffectTemplateData;
	import com.yheng.xianyuan.effectEditor.subject.RemoveEffectTemplateNotifyData;
	import com.yheng.xianyuan.effectEditor.subject.SubjectID;
	
	public class RemoveEffectTemplateCommand implements ICommand
	{
		public function RemoveEffectTemplateCommand()
		{
		}
		
		public function execute(data:Object=null):*
		{
			Assert.checkNull(data);
			
			var input:RemoveEffectTemplateCommandData = RemoveEffectTemplateCommandData(data);
			
			var effectsData:Vector.<EffectData> = Mediator.data.effectEditor_internal::getEffectsData();
			var effectsDataRemoved:Vector.<EffectData> = new Vector.<EffectData>();
			for each(var effectData:EffectData in effectsData)
			{
				if(effectData.templateID == input.effectTemplateID)
				{
					effectsDataRemoved.push(effectData);
				}
			}
			for each(var effectDataRemoved:EffectData in effectsDataRemoved)
			{
				Mediator.commands.executeCommand(CommandID.REMOVE_EFFECT, new RemoveEffectCommandData(effectDataRemoved.id));
			}
			
			var effectTemplatesData:Vector.<EffectTemplateData> = Mediator.data.effectEditor_internal::getEffectTemplatesData();
			var index:int = 0;
			for each(var effectTemplateData:EffectTemplateData in effectTemplatesData)
			{
				if(effectTemplateData.id == input.effectTemplateID)
				{
					Mediator.subjects.notifySubject(SubjectID.REMOVE_EFFECT_TEMPLATE, new RemoveEffectTemplateNotifyData(effectTemplateData));
					effectTemplatesData.splice(index, 1);
					return;
				}
				index++;
			}
			
			throw new NoSuchObjectException("Cannot find the effectTemplateID \"" + input.effectTemplateID + "\"");
			return null;
		}
	}
}