package com.yheng.xianyuan.effectEditor.command
{
	import com.codeTooth.actionscript.command.ICommand;
	import com.codeTooth.actionscript.lang.utils.FileUtil;
	
	import flash.events.FileListEvent;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.utils.ByteArray;
	
	import mx.controls.Alert;
	
	public class MergeBaseCommand implements ICommand
	{
		private var _fileName:String = null;
		
		private var _selectSysWndTitle:String = null;
		
		private var _mergeErrorLabel:String = null;
		
		private var _saveSysWndTitle:String = null;
		
		private var _saveErrorLabel:String = null;
		
		private var _outputBuffer:ByteArray = null;
		
		public function MergeBaseCommand(fileName:String, selectSysWndTitle:String, saveSysWndTitle:String, mergeErrorLabel:String, saveErrorLabel:String)
		{
			_fileName = fileName;
			_selectSysWndTitle = selectSysWndTitle;
			_saveSysWndTitle = saveSysWndTitle;
			_mergeErrorLabel = mergeErrorLabel;
			_saveErrorLabel = saveErrorLabel;
		}
		
		public function execute(data:Object=null):*
		{
			FileUtil.createFileStatic(_fileName, true, null, null, null, selectHandler).browseForOpenMultiple(_selectSysWndTitle);
		}
		
		private function selectHandler(event:FileListEvent):void
		{
			var files:Array = event.files;
			var bufferList:Vector.<ByteArray> = new Vector.<ByteArray>();
			for each(var file:File in files)
			{
				var stream:FileStream = null;
				try
				{
					stream = new FileStream();
					stream.open(file, FileMode.READ);
					var buffer:ByteArray = new ByteArray();
					stream.readBytes(buffer);
					bufferList.push(buffer);
				} 
				catch(error:Error) 
				{
					Alert.show(error.message, _mergeErrorLabel);
					return;
				}
				finally
				{
					if(stream != null)
					{
						stream.close();
					}
				}
			}
			
			_outputBuffer = new ByteArray();
			for each(var bufferListItem:ByteArray in bufferList)
			{
				_outputBuffer.writeUnsignedInt(bufferListItem.length);
				_outputBuffer.writeBytes(bufferListItem);
			}
			
			FileUtil.save(writeStream, exceptionHadnler, null, _saveSysWndTitle);
		}
		
		private function exceptionHadnler(error:Error):void
		{
			Alert.show(error.message, _saveErrorLabel);
		}
		
		private function writeStream(stream:FileStream):void
		{
			stream.writeBytes(_outputBuffer);
			_outputBuffer = null;
		}
	}
}