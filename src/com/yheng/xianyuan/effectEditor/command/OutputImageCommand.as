package com.yheng.xianyuan.effectEditor.command
{
	import com.codeTooth.actionscript.command.ICommand;
	import com.codeTooth.actionscript.lang.utils.FileUtil;
	import com.yheng.xianyuan.effectEditor.core.Mediator;
	import com.yheng.xianyuan.effectEditor.data.EffectTemplateData;
	
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	
	import mx.controls.Alert;
	
	public class OutputImageCommand implements ICommand
	{
		public function OutputImageCommand()
		{
		}
		
		public function execute(data:Object=null):*
		{
			FileUtil.createFileStatic("outputImageFile", true, selectHandler).browseForDirectory("选择导出图片的目录");
		}
		
		private function selectHandler():void
		{
			var file:File = FileUtil.getFileStatic("outputImageFile");
			var effectTemplates:Vector.<EffectTemplateData> = Mediator.commands.executeCommand(CommandID.GET_EFFECT_TEMPLATES_ALREADY_IN_USE);
			
			for each(var effectTemplate:EffectTemplateData in effectTemplates)
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