package com.yheng.xianyuan.effectEditor.command
{
	import com.codeTooth.actionscript.command.ICommand;
	import com.codeTooth.actionscript.lang.utils.Assert;
	import com.yheng.xianyuan.effectEditor.core.Mediator;
	import com.yheng.xianyuan.effectEditor.core.effectEditor_internal;
	import com.yheng.xianyuan.effectEditor.subject.SetNameNotifyData;
	import com.yheng.xianyuan.effectEditor.subject.SubjectID;
	
	public class SetNameCommand implements ICommand
	{
		public function SetNameCommand()
		{
		}
		
		public function execute(data:Object=null):*
		{
			Assert.checkNull(data);
			
			var input:SetNameCommandData = SetNameCommandData(data);
			Mediator.data.effectEditor_internal::setName(input.name);
			Mediator.subjects.notifySubject(SubjectID.SET_NAME, new SetNameNotifyData(input.name));
		}
	}
}