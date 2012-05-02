package com.yheng.xianyuan.effectEditor.view.window.mergeStageEffectWindow
{
	import flash.filesystem.File;

	internal class ListItem
	{
		public var label:String = null;
		
		public var file:File = null;
		
		public function ListItem(label:String, file:File)
		{
			this.label = label;
			this.file = file;
		}
	}
}