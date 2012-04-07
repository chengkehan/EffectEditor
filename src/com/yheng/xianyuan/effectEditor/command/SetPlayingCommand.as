package com.yheng.xianyuan.effectEditor.command
{
	import com.codeTooth.actionscript.command.ICommand;
	import com.codeTooth.actionscript.lang.utils.Assert;
	import com.yheng.xianyuan.effectEditor.core.Mediator;
	import com.yheng.xianyuan.effectEditor.core.effectEditor_internal;
	
	public class SetPlayingCommand implements ICommand
	{
		public function SetPlayingCommand()
		{
		}
		
		public function execute(data:Object=null):*
		{
			Assert.checkNull(data);
			
			var input:SetPlayingCommandData = SetPlayingCommandData(data);
			Mediator.data.effectEditor_internal::setPlaying(input.playing);
		}
	}
}