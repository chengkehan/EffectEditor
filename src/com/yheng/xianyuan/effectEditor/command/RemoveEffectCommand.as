package com.yheng.xianyuan.effectEditor.command
{
	import com.codeTooth.actionscript.command.ICommand;
	import com.codeTooth.actionscript.lang.exceptions.NoSuchObjectException;
	import com.codeTooth.actionscript.lang.utils.Assert;
	import com.yheng.xianyuan.effectEditor.core.Mediator;
	import com.yheng.xianyuan.effectEditor.core.effectEditor_internal;
	import com.yheng.xianyuan.effectEditor.data.EffectData;
	import com.yheng.xianyuan.effectEditor.subject.RemoveEffectNotifyData;
	import com.yheng.xianyuan.effectEditor.subject.SubjectID;
	
	public class RemoveEffectCommand implements ICommand
	{
		public function RemoveEffectCommand()
		{
		}
		
		public function execute(data:Object=null):*
		{
			Assert.checkNull(data);
			
			var input:RemoveEffectCommandData = RemoveEffectCommandData(data);
			var effectsData:Vector.<EffectData> = Mediator.data.effectEditor_internal::getEffectsData();
			var index:int = 0;
			for each(var effectData:EffectData in effectsData)
			{
				if(effectData.id == input.effectID)
				{
					Mediator.subjects.notifySubject(SubjectID.REMOVE_EFFECT, new RemoveEffectNotifyData(effectData));
					effectsData.splice(index, 1);
					return;
				}
				index++;
			}
			
			throw new NoSuchObjectException("Cannot find the effect id \"" + input.effectID + "\"");
		}
	}
}