package com.yheng.xianyuan.effectEditor.command
{
	import com.codeTooth.actionscript.command.ICommand;
	import com.yheng.xianyuan.effectEditor.core.Mediator;
	
	import mx.controls.Alert;
	import mx.events.CloseEvent;
	
	public class NewFileCommand implements ICommand
	{
		public function NewFileCommand()
		{
		}
		
		public function execute(data:Object=null):*
		{
			if(data == null || NewFileCommandData(data).alert)		
			{
				Alert.show("确定新建？", "", Alert.YES | Alert.NO, null, closeHandler);
			}
			else
			{
				Mediator.commands.executeCommand(CommandID.RESET);
			}
		}
		
		private function closeHandler(event:CloseEvent):void
		{
			if(event.detail == Alert.YES)
			{
				Mediator.commands.executeCommand(CommandID.RESET);
			}
		}
	}
}