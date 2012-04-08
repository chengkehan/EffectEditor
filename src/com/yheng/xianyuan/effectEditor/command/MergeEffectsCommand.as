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
	
	public class MergeEffectsCommand implements ICommand
	{
		private var _outputBuffer:ByteArray = null;
		
		public function MergeEffectsCommand()
		{
		}
		
		public function execute(data:Object=null):*
		{
			FileUtil.createFileStatic("mergeEffectsFile", true, null, null, null, selectHandler).browseForOpenMultiple("选择需要合并的数据");
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
					Alert.show(error.message, "合并数据时发生异常");
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
			
			FileUtil.save(writeStream, exceptionHadnler, null, "选择保存合并的数据的位置");
		}
		
		private function exceptionHadnler(error:Error):void
		{
			Alert.show(error.message, "保存合并数据时发生异常");
		}
		
		private function writeStream(stream:FileStream):void
		{
			stream.writeBytes(_outputBuffer);
			_outputBuffer = null;
		}
	}
}