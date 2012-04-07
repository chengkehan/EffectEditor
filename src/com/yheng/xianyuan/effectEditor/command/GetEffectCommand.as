package com.yheng.xianyuan.effectEditor.command
{
	import com.codeTooth.actionscript.command.ICommand;
	import com.codeTooth.actionscript.lang.exceptions.NoSuchObjectException;
	import com.codeTooth.actionscript.lang.utils.Assert;
	import com.yheng.xianyuan.effectEditor.core.Mediator;
	import com.yheng.xianyuan.effectEditor.core.effectEditor_internal;
	import com.yheng.xianyuan.effectEditor.data.EffectData;
	
	public class GetEffectCommand implements ICommand
	{
		public function GetEffectCommand()
		{
		}
		
		public function execute(data:Object=null):*
		{
			Assert.checkNull(data);
			
			var input:GetEffectCommandData = GetEffectCommandData(data);
			var effectsData:Vector.<EffectData> = Mediator.data.effectEditor_internal::getEffectsData();
			for each(var effectData:EffectData in effectsData)
			{
				if(effectData.id == input.effectID)
				{
					return effectData;
				}
			}
			
			throw new NoSuchObjectException("Cannot find the effectID \"" + input.effectID + "\"");
			return null;
		}
	}
}