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
		
		public function EffectData(id:Number, templateID:Number, origionX:int = 0, origionY:int = 0, emptyFramesPrefix:int = 0, emptyFramesSuffix:int = 0)
		{
			_id = id;
			_templateID = templateID;
			_origionX = origionX;
			_origionY = origionY;
			_emptyFramesPrefix = emptyFramesPrefix;
			_emptyFramesSuffix = emptyFramesSuffix;
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