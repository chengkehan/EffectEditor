package com.yheng.xianyuan.effectEditor.data
{
	import com.codeTooth.actionscript.lang.utils.destroy.IDestroy;
	import com.codeTooth.actionscript.lang.utils.newUniqueObject.IUniqueObject;
	import com.yheng.xianyuan.effectEditor.core.effectEditor_internal;
	
	import flash.display.BitmapData;
	import flash.utils.ByteArray;

	/**
	 * 特效模板数据
	 */
	public class EffectTemplateData implements IUniqueObject, IDestroy
	{
		// 模板名称
		private var _name:String = null;
		
		// 图片字节
		private var _bytes:ByteArray = null;
		
		// 位图
		private var _bmpd:BitmapData = null;
		
		// 描述数据
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
		
		effectEditor_internal function setBitmapData(bmpd:BitmapData):void
		{
			_bmpd = bmpd;
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