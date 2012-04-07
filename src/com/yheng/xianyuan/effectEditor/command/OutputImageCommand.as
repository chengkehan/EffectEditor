package com.yheng.xianyuan.effectEditor.command
{
	import com.codeTooth.actionscript.command.ICommand;
	import com.codeTooth.actionscript.lang.utils.FileUtil;
	import com.yheng.xianyuan.effectEditor.core.Mediator;
	import com.yheng.xianyuan.effectEditor.core.effectEditor_internal;
	import com.yheng.xianyuan.effectEditor.data.EffectData;
	import com.yheng.xianyuan.effectEditor.data.EffectTemplateData;
	
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.utils.Dictionary;
	
	import mx.controls.Alert;
	
	public class OutputImageCommand implements ICommand
	{
		public function OutputImageCommand()
		{
		}
		
		public function execute(data:Object=null):*
		{
			FileUtil.createFileStatic("outputImageFile", true, selectHandler).browseForSave("选择导出图片的目录");
		}
		
		private function selectHandler():void
		{
			var file:File = FileUtil.getFileStatic("outputImageFile");
			var effects:Vector.<EffectData> = Mediator.data.effectEditor_internal::getEffectsData();
			var effectTempaltes:Dictionary/*key effectTemplateID:Number, value EffectTempalteData*/ = new Dictionary();
			for each (var effect:EffectData in effects) 
			{
				if(effectTempaltes[effect.templateID] == null)
				{
					effectTempaltes[effect.templateID] = Mediator.commands.executeCommand(CommandID.GET_EFFECT_TEMPLATE, new GetEffectTemplateCommandData(effect.templateID));
				}
			}
			
			for each(var effectTemplate:EffectTemplateData in effectTempaltes)
			{
				var stream:FileStream = null;
				try
				{
					stream = new FileStream();
					var imageFile:File = file.resolvePath(effectTemplate.name);
					stream.open(imageFile, FileMode.WRITE);
					stream.writeBytes(effectTemplate.bytes);
				} 
				catch(error:Error) 
				{
					Alert.show(error.message, "导出图片时发生异常");
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
}