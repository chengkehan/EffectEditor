package com.yheng.xianyuan.effectEditor.view.controlPanel.library
{
	public class LibraryItemData
	{
		public var label:String = null;
		
		public var effectTemplateID:Number = 0;
		
		public function LibraryItemData(label:String, effectTemplateID:Number)
		{
			this.label = label;
			this.effectTemplateID = effectTemplateID;
		}
	}
}