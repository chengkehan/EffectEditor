package com.yheng.xianyuan.effectEditor.command
{
	import com.codeTooth.actionscript.command.ICommand;
	import com.codeTooth.actionscript.lang.utils.FileUtil;
	import com.yheng.xianyuan.effectEditor.persistence.EffectDataSerialize;
	
	import flash.filesystem.FileStream;
	import flash.utils.ByteArray;
	
	import mx.controls.Alert;
	
	public class OutputEffectCommand implements ICommand
	{
		public function OutputEffectCommand()
		{
		}
		
		public function execute(data:Object=null):*
		{
			FileUtil.save(writeStream, exceptionHandler, null, "导出当前数据");
		}
		
		private function exceptionHandler(error:Error):void
		{
			Alert.show(error.message, "导出当前数据时发生异常");
		}
		
		private function writeStream(stream:FileStream):void
		{
			var buffer:ByteArray = new ByteArray();
			new EffectDataSerialize().serialize(buffer);
			stream.writeBytes(buffer);
		}
	}
}