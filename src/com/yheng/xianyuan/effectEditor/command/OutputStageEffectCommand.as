package com.yheng.xianyuan.effectEditor.command
{
	import com.codeTooth.actionscript.command.ICommand;
	import com.codeTooth.actionscript.lang.utils.ByteArrayUtil;
	import com.codeTooth.actionscript.lang.utils.Common;
	import com.codeTooth.actionscript.lang.utils.FileUtil;
	import com.yheng.xianyuan.effectEditor.core.Mediator;
	import com.yheng.xianyuan.effectEditor.core.effectEditor_internal;
	import com.yheng.xianyuan.effectEditor.data.Data;
	import com.yheng.xianyuan.effectEditor.data.StageEffectData;
	import com.yheng.xianyuan.effectEditor.persistence.StageEffectSerialize;
	
	import flash.filesystem.FileStream;
	import flash.utils.ByteArray;
	
	import mx.controls.Alert;
	
	public class OutputStageEffectCommand implements ICommand
	{
		use namespace effectEditor_internal;
		
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
			var data:Data = Mediator.data;
			var stageEffect:StageEffectData = new StageEffectData();
			stageEffect.name = data.getName();
			stageEffect.fps = data.getFPS();
			stageEffect.effectTemplates = data.getEffectTemplatesData();
			stageEffect.effects = data.getEffectsData();
			stageEffect.data = data.getFPS() + Common.COLON + data.getEffectsData().length;
			
			var buffer:ByteArray = new ByteArray();
			new StageEffectSerialize().serialize(buffer, data.version, stageEffect);
			ByteArrayUtil.setVerification(buffer);
			stream.writeBytes(buffer);
		}
	}
}