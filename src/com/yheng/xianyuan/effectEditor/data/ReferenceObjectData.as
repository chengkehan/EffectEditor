package com.yheng.xianyuan.effectEditor.data
{
	import com.codeTooth.actionscript.lang.utils.destroy.IDestroy;
	import com.yheng.xianyuan.effectEditor.core.effectEditor_internal;
	
	import flash.utils.ByteArray;

	public class ReferenceObjectData implements IDestroy
	{
		private var _x:int = 0;
		
		private var _y:int = 0;
		
		private var _bytes:ByteArray = null;
		
		public function ReferenceObjectData()
		{
			
		}
		
		public function get x():int
		{
			return _x;
		}
		
		public function get y():int
		{
			return _y;
		}
		
		public function get bytes():ByteArray
		{
			return _bytes;
		}
		
		effectEditor_internal function setX(x:int):void
		{
			_x = x;
		}
		
		effectEditor_internal function setY(y:int):void
		{
			_y = y;
		}
		
		effectEditor_internal function setBytes(bytes:ByteArray):void
		{
			_bytes = bytes;
		}
		
		public function destroy():void
		{
			_bytes = null;
		}
	}
}