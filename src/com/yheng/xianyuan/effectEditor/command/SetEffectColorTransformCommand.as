package com.yheng.xianyuan.effectEditor.command
{
	import com.codeTooth.actionscript.command.ICommand;
	import com.codeTooth.actionscript.lang.utils.Assert;
	import com.yheng.xianyuan.effectEditor.core.Mediator;
	import com.yheng.xianyuan.effectEditor.core.effectEditor_internal;
	import com.yheng.xianyuan.effectEditor.data.EffectData;
	import com.yheng.xianyuan.effectEditor.subject.SetEffectColorTransformNotifyData;
	import com.yheng.xianyuan.effectEditor.subject.SubjectID;
	
	public class SetEffectColorTransformCommand implements ICommand
	{
		use namespace effectEditor_internal;
		
		public function SetEffectColorTransformCommand()
		{
		}
		
		public function execute(data:Object=null):*
		{
			Assert.checkNull(data);
			
			var input:SetEffectColorTransformCommandData = SetEffectColorTransformCommandData(data);
			var effect:EffectData = Mediator.commands.executeCommand(CommandID.GET_EFFECT, new GetEffectCommandData(input.effectID));
			effect.setA(input.a);
			effect.setR(input.r);
			effect.setG(input.g);
			effect.setB(input.b);
			effect.setAA(input.aa);
			effect.setAR(input.ar);
			effect.setAG(input.ag);
			effect.setAB(input.ab);
			effect.setCA(input.ca);
			effect.setCR(input.cr);
			effect.setCG(input.cg);
			effect.setCB(input.cb);
			effect.setL(input.l);
			
			Mediator.subjects.notifySubject(SubjectID.SET_EFFECT_COLOR_TRANSFORM, new SetEffectColorTransformNotifyData(effect));
		}
	}
}