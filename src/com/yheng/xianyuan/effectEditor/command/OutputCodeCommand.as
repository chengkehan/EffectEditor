package com.yheng.xianyuan.effectEditor.command
{
	import com.codeTooth.actionscript.command.ICommand;
	import com.codeTooth.actionscript.lang.utils.FileUtil;
	
	import flash.filesystem.File;
	
	import mx.controls.Alert;
	
	public class OutputCodeCommand implements ICommand
	{
		public function OutputCodeCommand()
		{
		}
		
		public function execute(data:Object=null):*
		{
			FileUtil.createFileStatic("outputCodeFile", true, selectHandler).browseForDirectory("选择保存到的目录");
		}
		
		private function selectHandler():void
		{
			var toDir:File = FileUtil.getFileStatic("outputCodeFile").resolvePath("effectCode");
			
			var sep:String = File.separator;
			var codeDir:File = File.applicationDirectory.resolvePath("effectCode");
			if(!codeDir.exists)
			{
				Alert.show("源文件丢失");
				return;
			}
			
			codeDir.copyTo(toDir, true);
		}
	}
}