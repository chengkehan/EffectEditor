package com.yheng.xianyuan.effectEditor.view.menu
{
	import com.codeTooth.actionscript.air.menu.Menu;
	import com.codeTooth.actionscript.lang.exceptions.NullPointerException;
	import com.yheng.xianyuan.effectEditor.command.CommandID;
	import com.yheng.xianyuan.effectEditor.core.Mediator;
	import com.yheng.xianyuan.effectEditor.subject.SubjectID;
	
	import flash.display.NativeWindow;
	import flash.events.Event;

	public class Menu
	{
		public function Menu(nativeWindow:NativeWindow)
		{
			if(nativeWindow == null)
			{
				throw new NullPointerException("Null input nativeWindow parameter.");
			}
			
			com.codeTooth.actionscript.air.menu.Menu.createMenu(
				new XML(
					<menu>
						<item label="文件">
							<item label="新建..." onClick="newFile"/>
							<item label="打开..." onClick="open"/>
							<item isSeparator="true"/>
							<item label="保存..." onClick="save"/>
							<item isSeparator="true"/>
							<item label="退出" onClick="exit"/>
						</item>
						<item label="工具">
							<item label="导出">
								<item label="特效库..." onClick="saveLibrary"/>
								<item label="舞台特效..." onClick="outputStageEffect"/>
							</item>
							<item label="导入">
								<item label="特效库..." onClick="openLibrary"/>
							</item>
							<item label="合并">
								<item label="特效库..." onClick="mergeLibrary"/>
								<item label="舞台特效..." onClick="mergeStageEffect"/>
							</item>
						</item>
					</menu>
				), nativeWindow, this
			);
		}
		
		public function newFile(event:Event):void
		{
			Mediator.commands.executeCommand(CommandID.NEW_FILE);
		}
		
		public function save(event:Event):void
		{
			Mediator.commands.executeCommand(CommandID.SAVE);
		}
		
		public function open(event:Event):void
		{
			Mediator.commands.executeCommand(CommandID.OPEN);
		}
		
		public function exit(event:Event):void
		{
			Mediator.commands.executeCommand(CommandID.EXIT);
		}
		
		public function saveLibrary(event:Event):void
		{
			Mediator.commands.executeCommand(CommandID.SAVE_LIBRARY);
		}
		
		public function openLibrary(event:Event):void
		{
			Mediator.commands.executeCommand(CommandID.OPEN_LIBRARY);
		}
		
		public function mergeLibrary(event:Event):void
		{
			Mediator.subjects.notifySubject(SubjectID.SHOW_MERGE_LIBRARY_WINDOW);
		}
		
		public function outputStageEffect(event:Event):void
		{
			Mediator.commands.executeCommand(CommandID.OUTPUT_STAGE_EFFECT);
		}
		
		public function mergeStageEffect(event:Event):void
		{
			Mediator.subjects.notifySubject(SubjectID.SHOW_MERGE_STAGE_EFFECT_WINDOW);
		}
	}
}