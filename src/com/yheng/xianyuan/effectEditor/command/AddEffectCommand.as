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
					
					var newEffectData:EffectData = new EffectData(
						input.effectID, input.effectTemplateID, input.origionX, input.origionY, input.prefix, input.suffix, 
						input.a, input.r, input.g, input.b, 
						input.aa, input.ar, input.ag, input.ab, 
						input.ca, input.cr, input.cg, input.cb, input.l, 
						input.v1, input.v2, input.v3, input.v4
					);
					effectsData.push(newEffectData);
					Mediator.subjects.notifySubject(SubjectID.ADD_EFFECT, new AddEffectNotifyData(newEffectData));
					
					if(newEffectData.v1 != Mediator.defaultValue.v1 || newEffectData.v2 != Mediator.defaultValue.v2 || newEffectData.v3 != Mediator.defaultValue.v3 || newEffectData.v4 != Mediator.defaultValue.v4)
					{
						Mediator.commands.executeCommand(CommandID.SET_EFFECT_COLOR_FILTER, new SetEffectColorFilterCommandData(
							newEffectData.id, newEffectData.v1, newEffectData.v2, newEffectData.v3, newEffectData.v4
						));
					}
					if(newEffectData.r != Mediator.defaultValue.r || newEffectData.g != Mediator.defaultValue.g || newEffectData.b != Mediator.defaultValue.b || newEffectData.a != Mediator.defaultValue.a || 
						newEffectData.ar != Mediator.defaultValue.ar || newEffectData.ag != Mediator.defaultValue.ag || newEffectData.ab != Mediator.defaultValue.ab || newEffectData.a != Mediator.defaultValue.a || 
						newEffectData.cr != Mediator.defaultValue.cr || newEffectData.cg != Mediator.defaultValue.cg || newEffectData.cb != Mediator.defaultValue.cb || newEffectData.ca != Mediator.defaultValue.ca || 
						newEffectData.l != Mediator.defaultValue.l
					)
					{
						Mediator.commands.executeCommand(CommandID.SET_EFFECT_COLOR_TRANSFORM, new SetEffectColorTransformCommandData(
							newEffectData.id, newEffectData.r, newEffectData.g, newEffectData.b, newEffectData.a, newEffectData.ar, newEffectData.ag, newEffectData.ab, newEffectData.aa, newEffectData.cr, newEffectData.cg, newEffectData.cb, newEffectData.ca, newEffectData.l	
						));
					}
					
					return;
				}
			}
			
			throw new NoSuchObjectException("Cannot find the effectDataID \"" + input.effectTemplateID + "\"");
		}
	}
}