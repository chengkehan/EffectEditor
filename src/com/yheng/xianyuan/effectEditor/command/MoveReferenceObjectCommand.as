package com.yheng.xianyuan.effectEditor.command
{
	import com.codeTooth.actionscript.command.ICommand;
	import com.codeTooth.actionscript.lang.utils.Assert;
	import com.yheng.xianyuan.effectEditor.core.Mediator;
	import com.yheng.xianyuan.effectEditor.core.effectEditor_internal;
	import com.yheng.xianyuan.effectEditor.subject.MoveReferenceObjectNotifyData;
	import com.yheng.xianyuan.effectEditor.subject.SubjectID;
	
	public class MoveReferenceObjectCommand implements ICommand
	{
		public function MoveReferenceObjectCommand()
		{
		}
		
		public function execute(data:Object=null):*
		{
			Assert.checkNull(data);
			
			var input:MoveReferenceObjectCommandData = MoveReferenceObjectCommandData(data);
			Mediator.data.effectEditor_internal::getReferenceObjectData().effectEditor_internal::setX(input.x);
			Mediator.data.effectEditor_internal::getReferenceObjectData().effectEditor_internal::setY(input.y);
			Mediator.subjects.notifySubject(
				SubjectID.MOVE_REFERENCE_OBJECT, 
				new MoveReferenceObjectNotifyData(Mediator.data.effectEditor_internal::getReferenceObjectData())
			);
		}
	}
}