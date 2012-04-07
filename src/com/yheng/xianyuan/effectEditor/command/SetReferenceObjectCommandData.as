package com.yheng.xianyuan.effectEditor.command
{
	import flash.utils.ByteArray;

	public class SetReferenceObjectCommandData
	{
		public var bytes:ByteArray = null;
		
		public function SetReferenceObjectCommandData(bytes:ByteArray)
		{
			this.bytes = bytes;
		}
	}
}