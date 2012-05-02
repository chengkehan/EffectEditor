package com.yheng.xianyuan.effectEditor.command
{
	import com.codeTooth.actionscript.command.ICommand;
	import com.codeTooth.actionscript.lang.utils.ByteArrayUtil;
	import com.codeTooth.actionscript.lang.utils.FileUtil;
	import com.yheng.xianyuan.effectEditor.persistence.StageEffectSerialize;
	
	import flash.filesystem.FileStream;
	import flash.utils.ByteArray;
	
	import mx.controls.Alert;
	
	public class OutputStageEffectCommand implements ICommand
	{
		public function OutputStageEffectCommand()
		{
		}
		
		public function execute(data:Object=null):*
		{
			FileUtil.save(writeStream, exceptionCatcher, null, "保存导出的舞台特效文件");
		}
		
		private function exceptionCatcher(error:Error):void
		{
			Alert.show(error.getStackTrace(), "保存导出的舞台特效文件时发生异常");
		}
		
		private function writeStream(stream:FileStream):void
		{
			var buffer:ByteArray = new ByteArray();
			new StageEffectSerialize().serialize(buffer);
			ByteArrayUtil.setVerification(buffer);
			stream.writeBytes(buffer);
		}
	}
}