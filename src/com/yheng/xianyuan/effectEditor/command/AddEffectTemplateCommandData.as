package com.yheng.xianyuan.effectEditor.command
{
	import flash.utils.ByteArray;

	public class AddEffectTemplateCommandData
	{
		public var effectTemplateID:Number = 0;
		
		public var name:String = null;
		
		public var bytes:ByteArray = null;
		
		public var sparrow:XML = null;
		
		public var completeCallback:Function = null;
		
		public function AddEffectTemplateCommandData(effectTemplateID:Number, name:String, bytes:ByteArray, sparrow:XML, completeCallback:Function = null)
		{
			this.effectTemplateID = effectTemplateID;
			this.name = name;
			this.bytes = bytes;
			this.sparrow = sparrow;
			this.completeCallback = completeCallback;
		}
	}
}