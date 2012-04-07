package com.yheng.xianyuan.effectEditor.command
{
	import com.codeTooth.actionscript.command.CommandID;
	
	public class CommandID extends com.codeTooth.actionscript.command.CommandID
	{
		public static const ADD_EFFECT_TEMPLATE:com.yheng.xianyuan.effectEditor.command.CommandID = createInstance("addEffectTemplate", com.yheng.xianyuan.effectEditor.command.CommandID);
		public static const REMOVE_EFFECT_TEMPLATE:com.yheng.xianyuan.effectEditor.command.CommandID = createInstance("removeEffectTemplate", com.yheng.xianyuan.effectEditor.command.CommandID);
		public static const GET_EFFECT_TEMPLATE:com.yheng.xianyuan.effectEditor.command.CommandID = createInstance("getEffectTemplate", com.yheng.xianyuan.effectEditor.command.CommandID);
		public static const CONTAINS_EFFECT_TEMPLATE:com.yheng.xianyuan.effectEditor.command.CommandID = createInstance("containsEffectTemplate", com.yheng.xianyuan.effectEditor.command.CommandID);
		
		public static const ADD_EFFECT:com.yheng.xianyuan.effectEditor.command.CommandID = createInstance("addEffect", com.yheng.xianyuan.effectEditor.command.CommandID);
		public static const REMOVE_EFFECT:com.yheng.xianyuan.effectEditor.command.CommandID = createInstance("removeEffect", com.yheng.xianyuan.effectEditor.command.CommandID);
		public static const GET_EFFECT:com.yheng.xianyuan.effectEditor.command.CommandID = createInstance("getEffect", com.yheng.xianyuan.effectEditor.command.CommandID);
		public static const SET_EFFECT_ORIGION:com.yheng.xianyuan.effectEditor.command.CommandID = createInstance("setEffectOrigion", com.yheng.xianyuan.effectEditor.command.CommandID);
		public static const SET_EFFECT_EMPTY_FRAMES:com.yheng.xianyuan.effectEditor.command.CommandID = createInstance("setEffectEmptyFrames", com.yheng.xianyuan.effectEditor.command.CommandID);
		
		public static const SET_WORKSPACE_COLOR:com.yheng.xianyuan.effectEditor.command.CommandID = createInstance("setWorkspaceColor", com.yheng.xianyuan.effectEditor.command.CommandID);
		public static const GET_WORKSPACE_COLOR:com.yheng.xianyuan.effectEditor.command.CommandID = createInstance("getWorkspaceColor", com.yheng.xianyuan.effectEditor.command.CommandID);

		public static const GET_PLAYING:com.yheng.xianyuan.effectEditor.command.CommandID = createInstance("getPlaying", com.yheng.xianyuan.effectEditor.command.CommandID);
		public static const SET_PLAYING:com.yheng.xianyuan.effectEditor.command.CommandID = createInstance("setPlaying", com.yheng.xianyuan.effectEditor.command.CommandID);
		
		public static const SAVE:com.yheng.xianyuan.effectEditor.command.CommandID = createInstance("save", com.yheng.xianyuan.effectEditor.command.CommandID);
		public static const SAVE_LIBRARY:com.yheng.xianyuan.effectEditor.command.CommandID = createInstance("saveLibrary", com.yheng.xianyuan.effectEditor.command.CommandID);
		public static const OPEN:com.yheng.xianyuan.effectEditor.command.CommandID = createInstance("open", com.yheng.xianyuan.effectEditor.command.CommandID);
		public static const OPEN_LIBRARY:com.yheng.xianyuan.effectEditor.command.CommandID = createInstance("openLibrary", com.yheng.xianyuan.effectEditor.command.CommandID);
		public static const RESET:com.yheng.xianyuan.effectEditor.command.CommandID = createInstance("reset", com.yheng.xianyuan.effectEditor.command.CommandID);
		public static const EXIT:com.yheng.xianyuan.effectEditor.command.CommandID = createInstance("exit", com.yheng.xianyuan.effectEditor.command.CommandID);
		public static const NEW_FILE:com.yheng.xianyuan.effectEditor.command.CommandID = createInstance("newFile", com.yheng.xianyuan.effectEditor.command.CommandID);
		public static const OUTPUT_EFFECT_COMMAND:com.yheng.xianyuan.effectEditor.command.CommandID = createInstance("outputEffectCommand", com.yheng.xianyuan.effectEditor.command.CommandID);
		public static const OUTPUT_IMAGE_COMMAND:com.yheng.xianyuan.effectEditor.command.CommandID = createInstance("outputImageCommand", com.yheng.xianyuan.effectEditor.command.CommandID);
		
		public static const SET_ASSISTANT_POINT_VISIBLE:com.yheng.xianyuan.effectEditor.command.CommandID = createInstance("setAssistantPointVisible", com.yheng.xianyuan.effectEditor.command.CommandID);
		public static const GET_ASSISTANT_POINT_VISIBLE:com.yheng.xianyuan.effectEditor.command.CommandID = createInstance("getAssistantPointVisible", com.yheng.xianyuan.effectEditor.command.CommandID);
		
		public static const SET_FPS:com.yheng.xianyuan.effectEditor.command.CommandID = createInstance("setFPS", com.yheng.xianyuan.effectEditor.command.CommandID);
		public static const GET_FPS:com.yheng.xianyuan.effectEditor.command.CommandID = createInstance("getFPS", com.yheng.xianyuan.effectEditor.command.CommandID);

		public static const SET_NAME:com.yheng.xianyuan.effectEditor.command.CommandID = createInstance("setName", com.yheng.xianyuan.effectEditor.command.CommandID);
		public static const GET_NAME:com.yheng.xianyuan.effectEditor.command.CommandID = createInstance("getName", com.yheng.xianyuan.effectEditor.command.CommandID);
		
		public static const SET_REFERENCE_OBJECT:com.yheng.xianyuan.effectEditor.command.CommandID = createInstance("setReferenceObject", com.yheng.xianyuan.effectEditor.command.CommandID);
		public static const CLEAR_REFERENCE_OBJECT:com.yheng.xianyuan.effectEditor.command.CommandID = createInstance("clearReferenceObject", com.yheng.xianyuan.effectEditor.command.CommandID);
		public static const GET_REFERENCE_OBJECT:com.yheng.xianyuan.effectEditor.command.CommandID = createInstance("getReferenceObject", com.yheng.xianyuan.effectEditor.command.CommandID);
		public static const MOVE_REFERENCE_OBJECT:com.yheng.xianyuan.effectEditor.command.CommandID = createInstance("moveReferenceObject", com.yheng.xianyuan.effectEditor.command.CommandID);
	}
}