package com.yheng.xianyuan.effectEditor.command
{
	import com.codeTooth.actionscript.command.ICommand;
	import com.yheng.xianyuan.effectEditor.core.Mediator;
	
	public class ExitCommand implements ICommand
	{
		public function ExitCommand()
		{
		}
		
		public function execute(data:Object=null):*
		{
			Mediator.document.stage.nativeWindow.close();
		}
	}
}