package com.yheng.xianyuan.effectEditor.data
{
	import com.codeTooth.actionscript.lang.utils.destroy.IDestroy;
	import com.codeTooth.actionscript.lang.utils.newUniqueObject.IUniqueObject;
	
	import flash.display.BitmapData;
	import flash.utils.ByteArray;

	public class EffectTemplateData implements IUniqueObject, IDestroy
	{
		private var _name:String = null;
		
		private var _bytes:ByteArray = null;
		
		private var _bmpd:BitmapData = null;
		
		private var _sparrow:XML = null;
		
		public function EffectTemplateData(id:Number, name:String, bmpd:BitmapData, bytes:ByteArray, sparrow:XML)
		{
			_id = id;
			_bmpd = bmpd;
			_bytes = bytes;
			_sparrow = sparrow;
			_name = name;
		}
		
		public function get bytes():ByteArray
		{
			return _bytes;
		}
		
		public function get name():String
		{
			return _name;
		}
		
		public function get bitmapData():BitmapData
		{
			return _bmpd;
		}
		
		public function get sparrow():XML
		{
			return _sparrow;
		}
		
		//------------------------------------------------------------------------------------------------------------------------------
		// 实现 IUniqueObject 接口
		//------------------------------------------------------------------------------------------------------------------------------
		
		private var _id:Number = 0;
		
		public function get id():Number
		{
			return _id;
		}
		
		//------------------------------------------------------------------------------------------------------------------------------
		// 实现 IDestroy 接口
		//------------------------------------------------------------------------------------------------------------------------------
		
		public function destroy():void
		{
			_bmpd = null;
			_sparrow = null;
		}
	}
}