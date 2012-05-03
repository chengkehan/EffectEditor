package com.yheng.xianyuan.effectEditor.command
{
	import com.codeTooth.actionscript.command.ICommand;
	import com.codeTooth.actionscript.lang.utils.ByteArrayUtil;
	import com.codeTooth.actionscript.lang.utils.FileUtil;
	import com.yheng.xianyuan.effectEditor.core.Mediator;
	import com.yheng.xianyuan.effectEditor.core.effectEditor_internal;
	import com.yheng.xianyuan.effectEditor.data.Data;
	import com.yheng.xianyuan.effectEditor.data.EffectData;
	import com.yheng.xianyuan.effectEditor.data.EffectTemplateData;
	import com.yheng.xianyuan.effectEditor.persistence.DataDeserialize;
	
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.utils.ByteArray;
	
	import mx.controls.Alert;
	
	public class OpenCommand implements ICommand
	{
		use namespace effectEditor_internal;
		
		private var _dataCache:Data = null;
		
		private var _effectTemplCompleteIndex:int = 0;
		
		public function OpenCommand()
		{
		}
		
		public function execute(data:Object=null):*
		{
			FileUtil.createFileStatic("openFile", true, selectHandler).browseForOpen("打开");
		}
		
		private function selectHandler():void
		{
			Mediator.commands.executeCommand(CommandID.RESET);
			
			var file:File = FileUtil.getFileStatic("openFile");
			var stream:FileStream = null;
			try
			{
				var buffer:ByteArray = new ByteArray();
				stream = new FileStream();
				stream.open(file, FileMode.READ);
				stream.readBytes(buffer);
				
				if(ByteArrayUtil.checkVerification(buffer, true))
				{
					_dataCache = new Data();
					new DataDeserialize().deserialize(buffer, _dataCache);
				}
				else
				{
					Alert.show("无法识别的文件格式");
				}
			} 
			catch(error:Error) 
			{
				Alert.show(error.message, "打开文件时发生异常");
				Mediator.commands.executeCommand(CommandID.RESET);
			}
			finally
			{
				if(stream != null)
				{
					stream.close();
				}
			}
			
			Mediator.commands.executeCommand(CommandID.SET_NAME, new SetNameCommandData(_dataCache.getName()));
			Mediator.commands.executeCommand(CommandID.SET_PLAYING, new SetPlayingCommandData(_dataCache.getPlaying()));
			Mediator.commands.executeCommand(CommandID.SET_ASSISTANT_POINT_VISIBLE, new SetAssistantPointVisibleCommandData(_dataCache.getAssistantPointVisible()));
			Mediator.commands.executeCommand(CommandID.SET_WORKSPACE_COLOR, new SetWorkspaceColorCommandData(_dataCache.getWorkspaceColor()));
			Mediator.commands.executeCommand(CommandID.SET_FPS, new SetFPSCommandData(_dataCache.getFPS()));
			
			if(_dataCache.getReferenceObjectData().bytes != null)
			{
				Mediator.commands.executeCommand(CommandID.SET_REFERENCE_OBJECT, new SetReferenceObjectCommandData(_dataCache.getReferenceObjectData().bytes));
				Mediator.commands.executeCommand(CommandID.MOVE_REFERENCE_OBJECT, new MoveReferenceObjectCommandData(_dataCache.getReferenceObjectData().x, _dataCache.getReferenceObjectData().y));
			}
			
			_effectTemplCompleteIndex = 0;
			loadEffectTmpl();
		}
		
		private function loadEffectTmpl():void
		{
			if(_effectTemplCompleteIndex == _dataCache.getEffectTemplatesData().length)
			{
				for each(var effect:EffectData in _dataCache.getEffectsData())
				{
					Mediator.commands.executeCommand(CommandID.ADD_EFFECT, new AddEffectCommandData(effect.templateID, effect.id, effect.origionX, effect.origionY, effect.emptyFramesPrefix, effect.emptyFramesSuffix));
				}
			}
			else
			{
				var tmpl:EffectTemplateData = _dataCache.getEffectTemplatesData()[_effectTemplCompleteIndex];
				_effectTemplCompleteIndex++;
				Mediator.commands.executeCommand(CommandID.ADD_EFFECT_TEMPLATE, new AddEffectTemplateCommandData(tmpl.id, tmpl.name, tmpl.bytes, tmpl.sparrow, effectTmplCompleteCallback, effectTmplErrorCallback));
			}
		}
		
		private function effectTmplCompleteCallback():void
		{
			loadEffectTmpl();
		}
		
		private function effectTmplErrorCallback():void
		{
			Mediator.commands.executeCommand(CommandID.RESET);
		}
	}
}