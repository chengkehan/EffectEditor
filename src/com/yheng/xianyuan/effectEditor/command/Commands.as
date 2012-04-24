package com.yheng.xianyuan.effectEditor.command
{
	import com.codeTooth.actionscript.command.CommandItem;
	import com.codeTooth.actionscript.command.Commands;
	
	public class Commands extends com.codeTooth.actionscript.command.Commands
	{
		public function Commands()
		{
			addCommandsCall(
				new CommandItem(CommandID.ADD_EFFECT_TEMPLATE, new AddEffectTemplateCommand()), 
				new CommandItem(CommandID.REMOVE_EFFECT_TEMPLATE, new RemoveEffectTemplateCommand()), 
				new CommandItem(CommandID.GET_EFFECT_TEMPLATE, new GetEffectTemplateCommand()), 
				new CommandItem(CommandID.CONTAINS_EFFECT_TEMPLATE, new ContainsEffectTemplateCommand()), 
				new CommandItem(CommandID.GET_EFFECT_TEMPLATES_ALREADY_IN_USE, new GetEffectTemplatesAlreadyInUseCommand()), 
				new CommandItem(CommandID.ADD_EFFECT, new AddEffectCommand()), 
				new CommandItem(CommandID.REMOVE_EFFECT, new RemoveEffectCommand()), 
				new CommandItem(CommandID.GET_EFFECT, new GetEffectCommand()), 
				new CommandItem(CommandID.SET_EFFECT_ORIGION, new SetEffectOrigionCommand()), 
				new CommandItem(CommandID.SET_WORKSPACE_COLOR, new SetWorkspaceColorCommand()), 
				new CommandItem(CommandID.GET_WORKSPACE_COLOR, new GetWorkspaceColorCommand()), 
				new CommandItem(CommandID.GET_PLAYING, new GetPlayingCommand()), 
				new CommandItem(CommandID.SET_PLAYING, new SetPlayingCommand()), 
				new CommandItem(CommandID.SAVE, new SaveCommand()), 
				new CommandItem(CommandID.SAVE_LIBRARY, new SaveLibraryCommand()), 
				new CommandItem(CommandID.OPEN, new OpenCommand()), 
				new CommandItem(CommandID.OPEN_LIBRARY, new OpenLibraryCommand()), 
				new CommandItem(CommandID.MERGE_LIBRARY, new MergeLibraryCommand()), 
				new CommandItem(CommandID.RESET, new ResetCommand()), 
				new CommandItem(CommandID.EXIT, new ExitCommand()), 
				new CommandItem(CommandID.NEW_FILE, new NewFileCommand()), 
				new CommandItem(CommandID.SET_EFFECT_EMPTY_FRAMES, new SetEffectEmptyFramesCommand()), 
				new CommandItem(CommandID.SET_ASSISTANT_POINT_VISIBLE, new SetAssistantPointVisibleCommand()), 
				new CommandItem(CommandID.GET_ASSISTANT_POINT_VISIBLE, new GetAssistantPointVisibleCommand()), 
				new CommandItem(CommandID.SET_FPS, new SetFPSCommand()), 
				new CommandItem(CommandID.GET_FPS, new GetFPSCommand()), 
				new CommandItem(CommandID.SET_NAME, new SetNameCommand()), 
				new CommandItem(CommandID.GET_NAME, new GetNameCommand()), 
				new CommandItem(CommandID.SET_REFERENCE_OBJECT, new SetReferenceObjectCommand()), 
				new CommandItem(CommandID.GET_REFERENCE_OBJECT, new GetReferenceObjectCommand()), 
				new CommandItem(CommandID.CLEAR_REFERENCE_OBJECT, new ClearReferenceObjectCommand()), 
				new CommandItem(CommandID.MOVE_REFERENCE_OBJECT, new MoveReferenceObjectCommand())
			);
		}
	}
}