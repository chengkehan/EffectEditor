package com.yheng.xianyuan.effectEditor.command
{
	import com.codeTooth.actionscript.command.ICommand;
	import com.codeTooth.actionscript.lang.utils.Assert;
	import com.yheng.xianyuan.effectEditor.core.Mediator;
	import com.yheng.xianyuan.effectEditor.core.effectEditor_internal;
	import com.yheng.xianyuan.effectEditor.subject.SetFPSNotifyData;
	import com.yheng.xianyuan.effectEditor.subject.SubjectID;
	
	public class SetFPSCommand implements ICommand
	{
		public function SetFPSCommand()
		{
		}
		
		public function execute(data:Object=null):*
		{
			Assert.checkNull(data);
			
			var input:SetFPSCommandData = SetFPSCommandData(data);
			Mediator.data.effectEditor_internal::setFPS(input.fps);
			Mediator.subjects.notifySubject(SubjectID.SET_FPS, new SetFPSNotifyData(input.fps));
		}
	}
}