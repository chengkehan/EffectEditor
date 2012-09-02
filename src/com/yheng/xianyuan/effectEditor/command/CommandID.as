package com.yheng.xianyuan.effectEditor.command
{
	public class CommandID
	{
		public static const ADD_EFFECT_TEMPLATE:AddEffectTemplateCommand = new AddEffectTemplateCommand();
		public static const REMOVE_EFFECT_TEMPLATE:RemoveEffectTemplateCommand = new RemoveEffectTemplateCommand();
		public static const GET_EFFECT_TEMPLATE:GetEffectTemplateCommand = new GetEffectTemplateCommand();
		public static const CONTAINS_EFFECT_TEMPLATE:ContainsEffectTemplateCommand = new ContainsEffectTemplateCommand();
		public static const GET_EFFECT_TEMPLATES_ALREADY_IN_USE:GetEffectTemplatesAlreadyInUseCommand = new GetEffectTemplatesAlreadyInUseCommand();
		
		public static const ADD_EFFECT:AddEffectCommand = new AddEffectCommand();
		public static const REMOVE_EFFECT:RemoveEffectCommand = new RemoveEffectCommand();
		public static const GET_EFFECT:GetEffectCommand = new GetEffectCommand();
		public static const SET_EFFECT_ORIGION:SetEffectOrigionCommand = new SetEffectOrigionCommand();
		public static const SET_EFFECT_EMPTY_FRAMES:SetEffectEmptyFramesCommand = new SetEffectEmptyFramesCommand();
		public static const SET_EFFECT_COLOR_TRANSFORM:SetEffectColorTransformCommand = new SetEffectColorTransformCommand();
		public static const SET_EFFECT_COLOR_FILTER:SetEffectColorFilterCommand = new SetEffectColorFilterCommand();
		
		public static const SET_WORKSPACE_COLOR:SetWorkspaceColorCommand = new SetWorkspaceColorCommand();
		public static const GET_WORKSPACE_COLOR:GetWorkspaceColorCommand = new GetWorkspaceColorCommand();

		public static const GET_PLAYING:GetPlayingCommand = new GetPlayingCommand();
		public static const SET_PLAYING:SetPlayingCommand = new SetPlayingCommand();
		
		public static const SAVE:SaveCommand = new SaveCommand();
		public static const SAVE_LIBRARY:SaveLibraryCommand = new SaveLibraryCommand();
		public static const OPEN:OpenCommand = new OpenCommand();
		public static const OPEN_LIBRARY:OpenLibraryCommand = new OpenLibraryCommand();
		public static const RESET:ResetCommand = new ResetCommand();
		public static const EXIT:ExitCommand = new ExitCommand();
		public static const NEW_FILE:NewFileCommand = new NewFileCommand();
		
		public static const SET_ASSISTANT_POINT_VISIBLE:SetAssistantPointVisibleCommand = new SetAssistantPointVisibleCommand();
		public static const GET_ASSISTANT_POINT_VISIBLE:GetAssistantPointVisibleCommand = new GetAssistantPointVisibleCommand();
		
		public static const SET_FPS:SetFPSCommand = new SetFPSCommand();
		public static const GET_FPS:GetFPSCommand = new GetFPSCommand();

		public static const SET_NAME:SetNameCommand = new SetNameCommand();
		public static const GET_NAME:GetNameCommand = new GetNameCommand();
		
		public static const SET_REFERENCE_OBJECT:SetReferenceObjectCommand = new SetReferenceObjectCommand();
		public static const CLEAR_REFERENCE_OBJECT:ClearReferenceObjectCommand = new ClearReferenceObjectCommand();
		public static const GET_REFERENCE_OBJECT:GetReferenceObjectCommand = new GetReferenceObjectCommand();
		public static const MOVE_REFERENCE_OBJECT:MoveReferenceObjectCommand = new MoveReferenceObjectCommand();
		
		public static const OUTPUT_STAGE_EFFECT:OutputStageEffectCommand = new OutputStageEffectCommand();
		public static const OUTPUT_CODE:OutputCodeCommand = new OutputCodeCommand();
	}
}