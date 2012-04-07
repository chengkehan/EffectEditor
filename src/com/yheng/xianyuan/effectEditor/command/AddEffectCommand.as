package com.yheng.xianyuan.effectEditor.command
{
	import com.codeTooth.actionscript.command.ICommand;
	import com.codeTooth.actionscript.lang.exceptions.IllegalOperationException;
	import com.codeTooth.actionscript.lang.exceptions.NoSuchObjectException;
	import com.codeTooth.actionscript.lang.utils.Assert;
	import com.yheng.xianyuan.effectEditor.core.Mediator;
	import com.yheng.xianyuan.effectEditor.core.effectEditor_internal;
	import com.yheng.xianyuan.effectEditor.data.EffectData;
	import com.yheng.xianyuan.effectEditor.data.EffectTemplateData;
	import com.yheng.xianyuan.effectEditor.subject.AddEffectNotifyData;
	import com.yheng.xianyuan.effectEditor.subject.SubjectID;
	
	public class AddEffectCommand implements ICommand
	{
		public function AddEffectCommand()
		{
		}
		
		public function execute(data:Object=null):*
		{
			Assert.checkNull(data);
			
			var input:AddEffectCommandData = AddEffectCommandData(data);
			var effectTemplatesData:Vector.<EffectTemplateData> = Mediator.data.effectEditor_internal::getEffectTemplatesData();
			for each(var effectTemplateData:EffectTemplateData in effectTemplatesData)
			{
				if(effectTemplateData.id == input.effectTemplateID)
				{
					var effectsData:Vector.<EffectData> = Mediator.data.effectEditor_internal::getEffectsData();
					for each(var effectData:EffectData in effectsData)
					{
						if(effectData.id == input.effectID)
						{
							throw new IllegalOperationException("Repeating effectDataID \"" + input.effectID + "\"");
						}
					}
					
					var newEffectData:EffectData = new EffectData(input.effectID, input.effectTemplateID, input.origionX, input.origionY, input.prefix, input.suffix);
					effectsData.push(newEffectData);
					Mediator.subjects.notifySubject(SubjectID.ADD_EFFECT, new AddEffectNotifyData(newEffectData));
					return;
				}
			}
			
			throw new NoSuchObjectException("Cannot find the effectDataID \"" + input.effectTemplateID + "\"");
		}
	}
}