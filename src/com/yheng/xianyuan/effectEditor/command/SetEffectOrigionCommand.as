package com.yheng.xianyuan.effectEditor.command
{
	import com.codeTooth.actionscript.command.ICommand;
	import com.codeTooth.actionscript.lang.exceptions.NoSuchObjectException;
	import com.codeTooth.actionscript.lang.utils.Assert;
	import com.yheng.xianyuan.effectEditor.core.Mediator;
	import com.yheng.xianyuan.effectEditor.core.effectEditor_internal;
	import com.yheng.xianyuan.effectEditor.data.EffectData;
	
	public class SetEffectOrigionCommand implements ICommand
	{
		public function SetEffectOrigionCommand()
		{
		}
		
		public function execute(data:Object=null):*
		{
			Assert.checkNull(data);
			
			var input:SetEffectOrigionCommandData = SetEffectOrigionCommandData(data);
			var effectsData:Vector.<EffectData> = Mediator.data.effectEditor_internal::getEffectsData();
			for each(var effectData:EffectData in effectsData)
			{
				if(effectData.id == input.effectID)
				{
					effectData.effectEditor_internal::setOrigionX(input.origionX);
					effectData.effectEditor_internal::setOrigionY(input.origionY);
					return;
				}
			}
			
			throw new NoSuchObjectException("Cannot find the effectDataID \"" + input.effectID + "\"");
		}
	}
}