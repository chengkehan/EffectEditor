package com.yheng.xianyuan.effectEditor.command
{
	import com.codeTooth.actionscript.command.ICommand;
	import com.codeTooth.actionscript.lang.utils.Assert;
	import com.yheng.xianyuan.effectEditor.core.Mediator;
	import com.yheng.xianyuan.effectEditor.core.effectEditor_internal;
	import com.yheng.xianyuan.effectEditor.data.EffectData;
	import com.yheng.xianyuan.effectEditor.subject.SetEffectColorFilterNotifyData;
	import com.yheng.xianyuan.effectEditor.subject.SubjectID;
	
	public class SetEffectColorFilterCommand implements ICommand
	{
		use namespace effectEditor_internal;
		
		public function SetEffectColorFilterCommand()
		{
		}
		
		public function execute(data:Object=null):*
		{
			Assert.checkNull(data);
			
			var input:SetEffectColorFilterCommandData = SetEffectColorFilterCommandData(data);
			var effect:EffectData = Mediator.commands.executeCommand(CommandID.GET_EFFECT, new GetEffectCommandData(input.effectID));
			effect.setV1(input.v1);
			effect.setV2(input.v2);
			effect.setV3(input.v3);
			effect.setV4(input.v4);
			
			Mediator.subjects.notifySubject(SubjectID.SET_EFFECT_COLOR_FILTER, new SetEffectColorFilterNotifyData(effect));
		}
	}
}