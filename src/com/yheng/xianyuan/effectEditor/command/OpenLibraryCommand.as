package com.yheng.xianyuan.effectEditor.command
{
	import com.codeTooth.actionscript.command.ICommand;
	import com.codeTooth.actionscript.lang.utils.ByteArrayUtil;
	import com.codeTooth.actionscript.lang.utils.FileUtil;
	import com.yheng.xianyuan.effectEditor.core.Mediator;
	import com.yheng.xianyuan.effectEditor.data.EffectTemplateData;
	import com.yheng.xianyuan.effectEditor.persistence.LibraryDeserialize;
	
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.utils.ByteArray;
	
	import mx.controls.Alert;
	
	public class OpenLibraryCommand implements ICommand
	{
		private var _tmpls:Vector.<EffectTemplateData> = null;
		
		private var _index:int = 0;
		
		public function OpenLibraryCommand()
		{
		}
		
		public function execute(data:Object=null):*
		{
			FileUtil.createFileStatic("openFile", true, selectHandler).browseForOpen("导入特效库");
		}
		
		private function selectHandler():void
		{
			var file:File = FileUtil.getFileStatic("openFile");
			var stream:FileStream = null;
			_tmpls = new Vector.<EffectTemplateData>();
			try
			{
				var buffer:ByteArray = new ByteArray();
				stream = new FileStream();
				stream.open(file, FileMode.READ);
				stream.readBytes(buffer);
				
				if(ByteArrayUtil.checkVerification(buffer, true))
				{
					_tmpls = new Vector.<EffectTemplateData>();
					new LibraryDeserialize().deserialize(buffer, _tmpls);
				}
				else
				{
					Alert.show("无法识别的特效库文件");
				}
			} 
			catch(error:Error) 
			{
				Alert.show(error.message, "无法识别的特效库文件");
				return;
			}
			finally
			{
				if(stream != null)
				{
					stream.close();
				}
			}
			
			_index = 0;
			loadTmpl();
		}
		
		private function loadTmpl():void
		{
			if(_index == _tmpls.length)
			{
				// Do nothing
			}
			else
			{
				var tmpl:EffectTemplateData = _tmpls[_index];
				_index++;
				if(Mediator.commands.executeCommand(CommandID.CONTAINS_EFFECT_TEMPLATE, new ContainsEffectTemplateCommandData(tmpl.id)))
				{
					Alert.show("存在重复的特效\"" + tmpl.name + "\"，id\"" + tmpl.id + "\".");
					tmplCompleteCallback();
				}
				else
				{
					Mediator.commands.executeCommand(CommandID.ADD_EFFECT_TEMPLATE, new AddEffectTemplateCommandData(tmpl.id, tmpl.name, tmpl.bytes, tmpl.sparrow, tmplCompleteCallback, tmplErrorCallback));
				}
			}
		}
		
		private function tmplCompleteCallback():void
		{
			loadTmpl();
		}
		
		private function tmplErrorCallback():void
		{
			tmplCompleteCallback();
		}
	}
}