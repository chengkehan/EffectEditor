package com.yheng.xianyuan.effectEditor.data
{
	import com.codeTooth.actionscript.lang.utils.destroy.IDestroy;
	import com.codeTooth.actionscript.lang.utils.newUniqueObject.IUniqueObject;
	import com.yheng.xianyuan.effectEditor.core.effectEditor_internal;

	/**
	 * 特效数据
	 */
	public class EffectData implements IUniqueObject, IDestroy
	{
		// 所使用的特效模板的ID
		private var _templateID:Number = 0;
		
		// 前置空帧数
		private var _emptyFramesPrefix:int = 0;
		
		// 后置空帧数
		private var _emptyFramesSuffix:int = 0;
		
		// 注册点x
		private var _origionX:int = 0;
		
		// 注册点y
		private var _origionY:int = 0;
		
		// 色彩转换
		private var _a:Number = 100;
		private var _r:Number = 100;
		private var _g:Number = 100;
		private var _b:Number = 100;
		private var _aa:Number = 0;
		private var _ar:Number = 0;
		private var _ag:Number = 0;
		private var _ab:Number = 0;
		
		// 色彩滤镜
		private var _v1:Number = 0;
		private var _v2:Number = 0;
		private var _v3:Number = 0;
		private var _v4:Number = 0;
		
		public function EffectData(
			id:Number, templateID:Number, origionX:int = 0, origionY:int = 0, emptyFramesPrefix:int = 0, emptyFramesSuffix:int = 0, 
			a:Number = 100, r:Number = 100, g:Number = 100, b:Number = 100, aa:Number = 0, ar:Number = 0, ag:Number = 0, ab:Number = 0, v1:Number = 0, v2:Number = 0, v3:Number = 0, v4:Number = 0
		)
		{
			_id = id;
			_templateID = templateID;
			_origionX = origionX;
			_origionY = origionY;
			_emptyFramesPrefix = emptyFramesPrefix;
			_emptyFramesSuffix = emptyFramesSuffix;
			_a = a;
			_r = r;
			_g = g;
			_aa = aa;
			_ar = ar;
			_ag = ag;
			_ab = ab;
			_v1 = v1;
			_v2 = v2;
			_v3 = v3;
			_v4 = v4;
		}
		
		public function get templateID():Number
		{
			return _templateID;
		}
		
		public function get origionX():int
		{
			return _origionX;
		}
		
		public function get origionY():int
		{
			return _origionY;
		}
		
		public function get emptyFramesPrefix():int
		{
			return _emptyFramesPrefix;
		}
		
		public function get emptyFramesSuffix():int
		{
			return _emptyFramesSuffix;
		}
		
		public function get a():Number
		{
			return _a;
		}
		
		public function get r():Number
		{
			return _r;
		}
		
		public function get g():Number
		{
			return _g;
		}
		
		public function get b():Number
		{
			return _b;	
		}
		
		public function get aa():Number
		{
			return _aa;	
		}
		
		public function get ar():Number
		{
			return _ar;
		}
		
		public function get ag():Number
		{
			return _ag;
		}
		
		public function get ab():Number
		{
			return _ab;	
		}
		
		public function get v1():Number
		{
			return _v1;
		}
		
		public function get v2():Number
		{
			return _v2;
		}
		
		public function get v3():Number
		{
			return _v3;
		}
		
		public function get v4():Number
		{
			return _v4;
		}
		
		effectEditor_internal function setOrigionX(value:int):void
		{
			_origionX = value;
		}
		
		effectEditor_internal function setOrigionY(value:int):void
		{
			_origionY = value;
		}
		
		effectEditor_internal function setEmptyFramesPrefix(value:int):void
		{
			_emptyFramesPrefix = value;
		}
		
		effectEditor_internal function setEmptyFramesSuffix(value:int):void
		{
			_emptyFramesSuffix = value;
		}
		
		effectEditor_internal function setA(value:Number):void
		{
			_a = value;
		}
		
		effectEditor_internal function setR(value:Number):void
		{
			_r = value;
		}
		
		effectEditor_internal function setG(value:Number):void
		{
			_g = value;
		}
		
		effectEditor_internal function setB(value:Number):void
		{
			_b = value;
		}
		
		effectEditor_internal function setAA(value:Number):void
		{
			_aa = value;
		}
		
		effectEditor_internal function setAR(value:Number):void
		{
			_ar = value;
		}
		
		effectEditor_internal function setAG(value:Number):void
		{
			_ag = value;
		}
		
		effectEditor_internal function setAB(value:Number):void
		{
			_ab = value;
		}
		
		effectEditor_internal function setV1(value:Number):void
		{
			_v1 = value;
		}
		
		effectEditor_internal function setV2(value:Number):void
		{
			_v2 = value;
		}
		
		effectEditor_internal function setV3(value:Number):void
		{
			_v3 = value;	
		}
		
		effectEditor_internal function setV4(value:Number):void
		{
			_v4 = value;
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
			
		}
	}
}