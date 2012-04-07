package com.yheng.xianyuan.effectEditor.command
{
	import com.codeTooth.actionscript.command.ICommand;
	import com.codeTooth.actionscript.lang.utils.FileUtil;
	import com.yheng.xianyuan.effectEditor.persistence.DataSerialize;
	
	import flash.filesystem.FileStream;
	import flash.utils.ByteArray;
	
	import mx.controls.Alert;
	
	public class SaveCommand implements ICommand
	{
		public function SaveCommand()
		{
		}
		
		public function execute(data:Object=null):*
		{
			FileUtil.save(writeStream, exceptionHandler, null, "保存");
		}
		
		private function exceptionHandler(error:Error):void
		{
			Alert.show(error.message, "保存文件时发生异常");
		}
		
		private function writeStream(stream:FileStream):void
		{
			var buffer:ByteArray = new ByteArray();
			new DataSerialize().serialize(buffer);
			stream.writeBytes(buffer);
		}
	}
}