package com.yheng.xianyuan.effectEditor.core
{
	import com.codeTooth.actionscript.game.action.ClipsDataManager;
	import com.codeTooth.actionscript.lang.exceptions.NullPointerException;
	import com.codeTooth.actionscript.lang.utils.newLoop.MainLoop;
	import com.codeTooth.actionscript.patterns.subject.Subjects;
	import com.codeTooth.actionscript.patterns.subject.registerSubjectID;
	import com.yheng.xianyuan.effectEditor.command.Commands;
	import com.yheng.xianyuan.effectEditor.data.Data;
	import com.yheng.xianyuan.effectEditor.subject.SubjectID;
	import com.yheng.xianyuan.effectEditor.view.window.Windows;
	
	import flash.display.DisplayObject;

	public class Mediator
	{
		public static const subjects:Subjects = new Subjects();
		
		public static const data:Data = new Data();
		
		public static const commands:Commands = new Commands();
		
		public static const clipsDataManager:ClipsDataManager = new ClipsDataManager();
		
		public static const mainLoop:MainLoop = new MainLoop(0);
		
		private static const _windows:Windows = new Windows();
		
		private static var _document:DisplayObject = null;
		
		private static var _initialized:Boolean = false;
		
		public static function initialize(document:DisplayObject):void
		{
			if(_initialized)
			{
				return;
			}
			if(document == null)
			{
				throw new NullPointerException("Null input docuemnt parameter.");
			}
			
			_initialized = true;
			_document = document;
			registerSubjectID(Vector.<Class>([SubjectID]), subjects);
			_windows.initialize(_document);
		}
		
		public static function get document():DisplayObject
		{
			return _document;
		}
	}
}