package com.yheng.xianyuan.effectEditor.view.menu
{
	import com.codeTooth.actionscript.air.menu.Menu;
	import com.codeTooth.actionscript.lang.exceptions.NullPointerException;
	import com.yheng.xianyuan.effectEditor.command.CommandID;
	import com.yheng.xianyuan.effectEditor.core.Mediator;
	
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
								<item label="当前数据..." onClick="outputEffect"/>
								<item label="当前图片..." onClick="outputImage"/>
								<item label="当前图片数据..."/>
							</item>
							<item label="导入">
								<item label="特效库..." onClick="openLibrary"/>
							</item>
							<item label="合并">
								<item label="多份数据..."/>
								<item label="多份图片数据..."/>
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
		
		public function outputEffect(event:Event):void
		{
			Mediator.commands.executeCommand(CommandID.OUTPUT_EFFECT_COMMAND);
		}
		
		public function outputImage(event:Event):void
		{
			Mediator.commands.executeCommand(CommandID.OUTPUT_IMAGE_COMMAND);
		}
	}
}