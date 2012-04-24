package com.yheng.xianyuan.effectEditor.view.window.mergeLibraryWindow
{
	import flash.filesystem.File;

	public class ListItem
	{
		public var file:File = null;
		
		public var label:String = null;
		
		public function ListItem(label:String, file:File)
		{
			this.label = label;
			this.file = file;
		}
	}
}