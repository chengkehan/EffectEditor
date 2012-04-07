package com.yheng.xianyuan.effectEditor.command
{
	import com.codeTooth.actionscript.command.ICommand;
	import com.codeTooth.actionscript.lang.utils.Assert;
	import com.yheng.xianyuan.effectEditor.core.Mediator;
	import com.yheng.xianyuan.effectEditor.core.effectEditor_internal;
	import com.yheng.xianyuan.effectEditor.subject.SetReferenceObjectNotifyData;
	import com.yheng.xianyuan.effectEditor.subject.SubjectID;
	
	public class SetReferenceObjectCommand implements ICommand
	{
		public function SetReferenceObjectCommand()
		{
		}
		
		public function execute(data:Object=null):*
		{
			Assert.checkNull(data);
			
			var input:SetReferenceObjectCommandData = SetReferenceObjectCommandData(data);
			Mediator.data.effectEditor_internal::getReferenceObjectData().effectEditor_internal::setBytes(input.bytes);
			Mediator.subjects.notifySubject(
				SubjectID.SET_REFERENCE_OBJECT, 
				new SetReferenceObjectNotifyData(Mediator.data.effectEditor_internal::getReferenceObjectData())
			);
		}
	}
}