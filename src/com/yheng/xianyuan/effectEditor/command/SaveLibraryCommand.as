package com.yheng.xianyuan.effectEditor.command
{
	import com.codeTooth.actionscript.command.ICommand;
	import com.codeTooth.actionscript.lang.utils.FileUtil;
	import com.yheng.xianyuan.effectEditor.persistence.LibrarySerialize;
	
	import flash.filesystem.FileStream;
	import flash.utils.ByteArray;
	
	import mx.controls.Alert;
	
	public class SaveLibraryCommand implements ICommand
	{
		public function SaveLibraryCommand()
		{
		}
		
		public function execute(data:Object=null):*
		{
			FileUtil.save(writeStream, exceptionHandler, null, "导出特效库");
		}
		
		private function exceptionHandler(error:Error):void
		{
			Alert.show(error.message, "导出特效库时发生异常");
		}
		
		private function writeStream(stream:FileStream):void
		{
			var buffer:ByteArray = new ByteArray();
			new LibrarySerialize().serialise(buffer);
			stream.writeBytes(buffer);
		}
	}
}