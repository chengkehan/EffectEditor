package com.yheng.xianyuan.effectEditor.command
{
	import com.codeTooth.actionscript.command.ICommand;
	import com.codeTooth.actionscript.lang.exceptions.NoSuchObjectException;
	import com.codeTooth.actionscript.lang.utils.Assert;
	import com.yheng.xianyuan.effectEditor.core.Mediator;
	import com.yheng.xianyuan.effectEditor.core.effectEditor_internal;
	import com.yheng.xianyuan.effectEditor.data.EffectData;
	import com.yheng.xianyuan.effectEditor.subject.SetEffectEmptyFramesNotifyData;
	import com.yheng.xianyuan.effectEditor.subject.SubjectID;
	
	public class SetEffectEmptyFramesCommand implements ICommand
	{
		public function SetEffectEmptyFramesCommand()
		{
		}
		
		public function execute(data:Object=null):*
		{
			Assert.checkNull(data);
			
			var input:SetEffectEmptyFramesCommandData = SetEffectEmptyFramesCommandData(data);
			var effectsData:Vector.<EffectData> = Mediator.data.effectEditor_internal::getEffectsData();
			for each(var effectData:EffectData in effectsData)
			{
				if(effectData.id == input.effectID)
				{
					effectData.effectEditor_internal::setEmptyFramesPrefix(input.prefix);
					effectData.effectEditor_internal::setEmptyFramesSuffix(input.suffix);
					Mediator.subjects.notifySubject(SubjectID.SET_EFFECT_EMPTY_FRAMES, new SetEffectEmptyFramesNotifyData(effectData));
					return;
				}
			}
			
			throw new NoSuchObjectException("Cannot find the effectDataID \"" + input.effectID + "\"");
		}
	}
}