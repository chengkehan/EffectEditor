package com.yheng.xianyuan.effectEditor.command
{
	import com.codeTooth.actionscript.command.ICommand;
	import com.codeTooth.actionscript.lang.utils.Assert;
	import com.yheng.xianyuan.effectEditor.core.Mediator;
	import com.yheng.xianyuan.effectEditor.core.effectEditor_internal;
	import com.yheng.xianyuan.effectEditor.subject.SetAssistantPointVisibleNotifyData;
	import com.yheng.xianyuan.effectEditor.subject.SubjectID;
	
	public class SetAssistantPointVisibleCommand implements ICommand
	{
		public function SetAssistantPointVisibleCommand()
		{
		}
		
		public function execute(data:Object=null):*
		{
			Assert.checkNull(data);
			
			var input:SetAssistantPointVisibleCommandData = SetAssistantPointVisibleCommandData(data);
			Mediator.data.effectEditor_internal::setAssistantPointVisible(input.visible);
			Mediator.subjects.notifySubject(SubjectID.SET_ASSISTANT_POINT_VISIBLE, new SetAssistantPointVisibleNotifyData(input.visible));
		}
	}
}