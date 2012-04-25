package com.yheng.xianyuan.effectEditor.command
{
	import com.codeTooth.actionscript.command.ICommand;
	import com.codeTooth.actionscript.lang.utils.ByteArrayUtil;
	import com.codeTooth.actionscript.lang.utils.FileUtil;
	import com.yheng.xianyuan.effectEditor.persistence.EffectSerialize;
	
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
			FileUtil.save(writeStream, exceptionCatcher, null, "保存导出的特效文件");
		}
		
		private function exceptionCatcher(error:Error):void
		{
			Alert.show(error.getStackTrace(), "保存导出的特效文件时发生异常");
		}
		
		private function writeStream(stream:FileStream):void
		{
			var buffer:ByteArray = new ByteArray();
			new EffectSerialize().serialize(buffer);
			ByteArrayUtil.setVerification(buffer);
			stream.writeBytes(buffer);
		}
	}
}