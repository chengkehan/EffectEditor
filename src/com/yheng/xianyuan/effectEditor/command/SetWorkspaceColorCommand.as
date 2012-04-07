package com.yheng.xianyuan.effectEditor.command
{
	import com.codeTooth.actionscript.command.ICommand;
	import com.codeTooth.actionscript.lang.utils.Assert;
	import com.yheng.xianyuan.effectEditor.core.Mediator;
	import com.yheng.xianyuan.effectEditor.core.effectEditor_internal;
	import com.yheng.xianyuan.effectEditor.subject.SetWorkspaceColorNotifyData;
	import com.yheng.xianyuan.effectEditor.subject.SubjectID;
	
	public class SetWorkspaceColorCommand implements ICommand
	{
		public function SetWorkspaceColorCommand()
		{
		}
		
		public function execute(data:Object=null):*
		{
			Assert.checkNull(data);
			
			var input:SetWorkspaceColorCommandData = SetWorkspaceColorCommandData(data);
			Mediator.data.effectEditor_internal::setWorkspaceColor(input.color);
			Mediator.subjects.notifySubject(SubjectID.SET_WORKSPACE_COLOR, new SetWorkspaceColorNotifyData(input.color));
		}
	}
}