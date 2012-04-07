package com.yheng.xianyuan.effectEditor.command
{
	import com.codeTooth.actionscript.command.ICommand;
	import com.yheng.xianyuan.effectEditor.core.Mediator;
	import com.yheng.xianyuan.effectEditor.core.effectEditor_internal;
	import com.yheng.xianyuan.effectEditor.subject.SubjectID;
	
	public class ClearReferenceObjectCommand implements ICommand
	{
		public function ClearReferenceObjectCommand()
		{
		}
		
		public function execute(data:Object=null):*
		{
			Mediator.data.effectEditor_internal::getReferenceObjectData().effectEditor_internal::setBytes(null);
			Mediator.subjects.notifySubject(SubjectID.CLEAR_REFERENCE_OBJECT);
		}
	}
}