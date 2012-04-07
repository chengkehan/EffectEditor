package com.yheng.xianyuan.effectEditor.command
{
	import com.codeTooth.actionscript.command.ICommand;
	import com.codeTooth.actionscript.lang.utils.FileUtil;
	import com.yheng.xianyuan.effectEditor.core.Mediator;
	import com.yheng.xianyuan.effectEditor.persistence.DataDeserialize;
	
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.utils.ByteArray;
	
	import mx.controls.Alert;
	
	public class OpenCommand implements ICommand
	{
		public function OpenCommand()
		{
		}
		
		public function execute(data:Object=null):*
		{
			FileUtil.createFileStatic("openFile", true, selectHandler).browseForOpen("打开");
		}
		
		private function selectHandler():void
		{
			Mediator.commands.executeCommand(CommandID.RESET);
			
			var file:File = FileUtil.getFileStatic("openFile");
			var stream:FileStream = null;
			try
			{
				var buffer:ByteArray = new ByteArray();
				stream = new FileStream();
				stream.open(file, FileMode.READ);
				stream.readBytes(buffer);
				new DataDeserialize().deserialize(buffer);
			} 
			catch(error:Error) 
			{
				Alert.show(error.message, "打开文件时发生异常");
				Mediator.commands.executeCommand(CommandID.RESET);
			}
			finally
			{
				if(stream != null)
				{
					stream.close();
				}
			}
		}
	}
}