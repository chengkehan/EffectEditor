package com.yheng.xianyuan.effectEditor.command
{
	import com.codeTooth.actionscript.command.ICommand;
	import com.codeTooth.actionscript.lang.utils.FileUtil;
	import com.yheng.xianyuan.effectEditor.core.Mediator;
	import com.yheng.xianyuan.effectEditor.data.EffectTemplateData;
	import com.yheng.xianyuan.effectEditor.persistence.EffectDataSerialize;
	import com.yheng.xianyuan.effectEditor.persistence.ImageSerialize;
	
	import flash.filesystem.FileStream;
	import flash.utils.ByteArray;
	
	import mx.controls.Alert;
	
	public class OutputEffectAndImageCommand implements ICommand
	{
		public function OutputEffectAndImageCommand()
		{
		}
		
		public function execute(data:Object=null):*
		{
			FileUtil.save(writeStream, exceptionHandler, null, "保存数据图片");
		}
		
		private function exceptionHandler(error:Error):void
		{
			Alert.show(error.message, "保存数据图片时发生异常");
		}
		
		private function writeStream(stream:FileStream):void
		{
			var buffer:ByteArray = new ByteArray();
			new EffectDataSerialize().serialize(buffer);
			
			var effectTempaltes:Vector.<EffectTemplateData> = Mediator.commands.executeCommand(CommandID.GET_EFFECT_TEMPLATES_ALREADY_IN_USE);
			buffer.writeUnsignedInt(effectTempaltes.length);
			for each(var effectTemplate:EffectTemplateData in effectTempaltes)
			{
				new ImageSerialize().serialize(buffer, effectTemplate.bytes, effectTemplate.id);
			}
			
			stream.writeBytes(buffer);
		}
	}
}