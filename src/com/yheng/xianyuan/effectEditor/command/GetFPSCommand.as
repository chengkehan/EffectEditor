package com.yheng.xianyuan.effectEditor.command
{
	import com.codeTooth.actionscript.command.ICommand;
	import com.yheng.xianyuan.effectEditor.core.Mediator;
	import com.yheng.xianyuan.effectEditor.core.effectEditor_internal;
	
	public class GetFPSCommand implements ICommand
	{
		public function GetFPSCommand()
		{
		}
		
		public function execute(data:Object=null):*
		{
			return Mediator.data.effectEditor_internal::getFPS();
		}
	}
}