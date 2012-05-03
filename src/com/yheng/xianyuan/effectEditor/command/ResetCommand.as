package com.yheng.xianyuan.effectEditor.command
{
	import com.codeTooth.actionscript.command.ICommand;
	import com.codeTooth.actionscript.lang.utils.Common;
	import com.yheng.xianyuan.effectEditor.core.Mediator;
	import com.yheng.xianyuan.effectEditor.core.effectEditor_internal;
	import com.yheng.xianyuan.effectEditor.data.EffectTemplateData;
	
	public class ResetCommand implements ICommand
	{
		public function ResetCommand()
		{
		}
		
		public function execute(data:Object=null):*
		{
			var effectTemplatesData:Vector.<EffectTemplateData> = Mediator.data.effectEditor_internal::getEffectTemplatesData().concat();
			for each(var effectTemplateData:EffectTemplateData in effectTemplatesData)
			{
				Mediator.commands.executeCommand(CommandID.REMOVE_EFFECT_TEMPLATE, new RemoveEffectTemplateCommandData(effectTemplateData.id));
			}
			
			Mediator.commands.executeCommand(CommandID.CLEAR_REFERENCE_OBJECT);
			Mediator.commands.executeCommand(CommandID.SET_WORKSPACE_COLOR, new SetWorkspaceColorCommandData(0x000000));
			Mediator.commands.executeCommand(CommandID.SET_NAME, new SetNameCommandData(Common.EMPTY_STRING));
			Mediator.commands.executeCommand(CommandID.SET_ASSISTANT_POINT_VISIBLE, new SetAssistantPointVisibleCommandData(true));
			Mediator.commands.executeCommand(CommandID.SET_PLAYING, new SetPlayingCommandData(true));
			Mediator.commands.executeCommand(CommandID.SET_FPS, new SetFPSCommandData(30));
			Mediator.data.effectEditor_internal::reset();
		}
	}
}