package com.yheng.xianyuan.effectEditor.command
{
	import com.codeTooth.actionscript.command.ICommand;
	import com.yheng.xianyuan.effectEditor.core.Mediator;
	import com.yheng.xianyuan.effectEditor.core.effectEditor_internal;
	import com.yheng.xianyuan.effectEditor.data.EffectData;
	import com.yheng.xianyuan.effectEditor.data.EffectTemplateData;
	
	import flash.utils.Dictionary;
	
	public class GetEffectTemplatesAlreadyInUseCommand implements ICommand
	{
		public function GetEffectTemplatesAlreadyInUseCommand()
		{
		}
		
		public function execute(data:Object=null):*
		{
			var effects:Vector.<EffectData> = Mediator.data.effectEditor_internal::getEffectsData();
			var effectTempaltes:Dictionary/*key effectTemplateID:Number, value EffectTempalteData*/ = new Dictionary();
			for each (var effect:EffectData in effects) 
			{
				if(effectTempaltes[effect.templateID] == null)
				{
					effectTempaltes[effect.templateID] = Mediator.commands.executeCommand(CommandID.GET_EFFECT_TEMPLATE, new GetEffectTemplateCommandData(effect.templateID));
				}
			}
			
			var result:Vector.<EffectTemplateData> = new Vector.<EffectTemplateData>();
			for each(var effectTemplate:EffectTemplateData in effectTempaltes)
			{
				result.push(effectTemplate);
			}
			
			return result;
		}
	}
}