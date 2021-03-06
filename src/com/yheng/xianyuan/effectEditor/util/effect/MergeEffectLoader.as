package com.yheng.xianyuan.effectEditor.util.effect
{
	import com.codeTooth.actionscript.lang.exceptions.NullPointerException;
	import com.codeTooth.actionscript.lang.utils.Common;
	import com.codeTooth.actionscript.lang.utils.destroy.DestroyUtil;
	import com.codeTooth.actionscript.lang.utils.destroy.IDestroy;
	import com.yheng.xianyuan.effectEditor.core.effectEditor_internal;
	import com.yheng.xianyuan.effectEditor.data.EffectData;
	import com.yheng.xianyuan.effectEditor.data.EffectTemplateData;
	import com.yheng.xianyuan.effectEditor.data.StageEffectData;
	import com.yheng.xianyuan.effectEditor.persistence.StageEffectDeserialize;
	
	import flash.events.EventDispatcher;
	import flash.utils.ByteArray;

	internal class MergeEffectLoader extends EventDispatcher implements IDestroy
	{
		private var _stageEffectList:Vector.<StageEffectData> = null;
		
		private var _bmpdLoaders:Vector.<BitmapDataLoader> = null;
		
		private var _completeCount:int = 0;
		
		private var _complete:Boolean = false;
		
		private var _completeCallback:Function = null;
		
		public function MergeEffectLoader()
		{
			
		}
		
		public function loadBytes(bytes:ByteArray, completeCallback:Function):void
		{
			if(bytes == null)
			{
				throw new NullPointerException("Null input bytes parameter.");
			}
			if(completeCallback == null)
			{
				throw new NullPointerException("Null completeCallback parameter.");
			}
			
			destroy();
			
			_completeCallback = completeCallback;
			_stageEffectList = new Vector.<StageEffectData>();
			parseBytes(bytes);
			
			if(_stageEffectList.length > 0)
			{
				var stageEffect:StageEffectData = _stageEffectList[0];
				_bmpdLoaders = new Vector.<BitmapDataLoader>();
				for each(var effectTemplate:EffectTemplateData in stageEffect.effectTemplates)
				{
					var bmpdLoader:BitmapDataLoader = new BitmapDataLoader(effectTemplate, bmpdLoadCompleteCallback);
					_bmpdLoaders.push(bmpdLoader);
				}
			}
			else
			{
				loadCompleteInvoke();
			}
		}
		
		public function getStageEffectList():Vector.<StageEffectData>
		{
			return _stageEffectList;
		}
		
		private function bmpdLoadCompleteCallback():void
		{
			if(++_completeCount >= _stageEffectList[0].effectTemplates.length)
			{
				loadCompleteInvoke();
			}
		}
		
		private function loadCompleteInvoke():void
		{
			_complete = true;
			_completeCallback();
		}
		
		private function parseBytes(bytes:ByteArray):void
		{
			var stageEffectMerge:StageEffectData = new StageEffectData();
			new StageEffectDeserialize().deserialize(bytes, stageEffectMerge);
			var i:int = 0;
			
			var stageEffect:StageEffectData = null;
			var names:String = stageEffectMerge.name
			var nameBlocks:Array = names.split(Common.SEMICOLON);
			for each(var nameBlock:String in nameBlocks)
			{
				stageEffect = new StageEffectData();
				stageEffect.name = nameBlock;
				stageEffect.effects = new Vector.<EffectData>();
				stageEffect.effectTemplates = stageEffectMerge.effectTemplates;
				_stageEffectList.push(stageEffect);
			}
			
			var numStageEffects:uint = _stageEffectList.length;
			
			var fpsAndLength:String = stageEffectMerge.data
			var fpsAndLengthBlocks:Array = fpsAndLength.split(Common.SEMICOLON);
			for (i = 0; i < numStageEffects; i++) 
			{
				var fpsAndLengthBlock:Array = String(fpsAndLengthBlocks[i]).split(Common.COLON);
				_stageEffectList[i].fps = fpsAndLengthBlock[0];
				_stageEffectList[i].data = fpsAndLengthBlock[1];
			}
			
			var iFrom:int = 0;
			var iTo:int = 0;
			for each(stageEffect in _stageEffectList)
			{
				iFrom = iTo;
				iTo += int(stageEffect.data);
				for(i = iFrom; i < iTo; i++)
				{
					stageEffect.effects.push(stageEffectMerge.effects[i]);
				}
			}
		}

		internal function destroyBitmapData():void
		{
			for each(var stageEffect:StageEffectData in _stageEffectList)
			{
				for each(var effectTempalte:EffectTemplateData in stageEffect.effectTemplates)
				{
					if(effectTempalte.bitmapData != null)
					{
						effectTempalte.bitmapData.dispose();
						effectTempalte.effectEditor_internal::setBitmapData(null);
					}
				}
			}
		}
		
		public function destroy():void
		{
			destroyBitmapData();
			
			DestroyUtil.destroyVector(_stageEffectList);
			_stageEffectList = null;
			
			DestroyUtil.destroyVector(_bmpdLoaders);
			_bmpdLoaders = null;
		}
	}
}


import com.codeTooth.actionscript.lang.exceptions.NullPointerException;
import com.codeTooth.actionscript.lang.utils.destroy.IDestroy;
import com.yheng.xianyuan.effectEditor.core.effectEditor_internal;
import com.yheng.xianyuan.effectEditor.data.EffectTemplateData;

import flash.display.Bitmap;
import flash.display.Loader;
import flash.events.Event;

class BitmapDataLoader implements IDestroy
{
	private var _effectTempalte:EffectTemplateData = null;
	
	private var _completeCallback:Function = null;
	
	private var _loader:Loader = null;
	
	public function BitmapDataLoader(effectTemplate:EffectTemplateData, completeCallback:Function)
	{
		_effectTempalte = effectTemplate;
		_completeCallback = completeCallback;
		
		_loader = new Loader();
		_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, completeHandler);
		_loader.loadBytes(effectTemplate.bytes);
	}
	
	private function completeHandler(event:Event):void
	{
		_effectTempalte.effectEditor_internal::setBitmapData(Bitmap(_loader.content).bitmapData);
		_completeCallback();
		destroy();
	}
	
	private function destroyLoader():void
	{
		if(_loader != null)
		{
			try
			{
				_loader.close();
			} 
			catch(error:Error) 
			{
				// Do nothing
			}
			_loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, completeHandler);
			_loader = null;
		}
	}
	
	public function destroy():void
	{
		_effectTempalte = null;
		_completeCallback = null;
		destroyLoader();
	}
}