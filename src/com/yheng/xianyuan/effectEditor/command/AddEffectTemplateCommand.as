package com.yheng.xianyuan.effectEditor.command
{
	import com.codeTooth.actionscript.command.ICommand;
	import com.codeTooth.actionscript.lang.exceptions.IllegalOperationException;
	import com.codeTooth.actionscript.lang.utils.Assert;
	import com.yheng.xianyuan.effectEditor.core.Mediator;
	import com.yheng.xianyuan.effectEditor.core.effectEditor_internal;
	import com.yheng.xianyuan.effectEditor.data.EffectTemplateData;
	import com.yheng.xianyuan.effectEditor.subject.AddEffectTemplateNotifyData;
	import com.yheng.xianyuan.effectEditor.subject.SubjectID;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	
	import mx.controls.Alert;
	
	public class AddEffectTemplateCommand implements ICommand
	{
		private var _input:AddEffectTemplateCommandData = null;
		
		private var _pngLoader:Loader = null;
		
		public function AddEffectTemplateCommand()
		{
		}
		
		public function execute(data:Object=null):*
		{
			Assert.checkNull(data);
			
			_input = AddEffectTemplateCommandData(data);
			
			if(_pngLoader == null)
			{
				_pngLoader = new Loader();
				_pngLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, pngLoaderCompleteHandler);
				_pngLoader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, pngLoaderIOErrorHandler);
				_pngLoader.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR, pngLoaderSecurityErrorHandler);
			}
			_pngLoader.loadBytes(_input.bytes);
		}
		
		private function pngLoaderCompleteHandler(event:Event):void
		{
			var bmpd:BitmapData = null;
			try
			{
				bmpd = Bitmap(_pngLoader.content).bitmapData;
			} 
			catch(error:Error) 
			{
				errorCallbackInvoke();
				Alert.show(error.getStackTrace(), "读取PNG图片时发生异常");
				return;
			}
			
			var effectTemplatesData:Vector.<EffectTemplateData> = Mediator.data.effectEditor_internal::getEffectTemplatesData();
			for each(var effectData:EffectTemplateData in effectTemplatesData)
			{
				if(effectData.id == _input.effectTemplateID)
				{
					throw new IllegalOperationException("Repeating id \"" + _input.effectTemplateID + "\"");
				}
			}
			
			var newEffectTemplateData:EffectTemplateData = new EffectTemplateData(_input.effectTemplateID, _input.name, bmpd, _input.bytes, _input.sparrow);
			effectTemplatesData.push(newEffectTemplateData);
			Mediator.subjects.notifySubject(SubjectID.ADD_EFFECT_TEMPLATE, new AddEffectTemplateNotifyData(newEffectTemplateData));
			
			Mediator.clipsDataManager.createClipsData(_input.effectTemplateID, _input.sparrow, bmpd);
			
			if(_input.completeCallback != null)
			{
				_input.completeCallback();
			}
		}
		
		private function pngLoaderIOErrorHandler(event:IOErrorEvent):void
		{
			errorCallbackInvoke();
			Alert.show(event.text, "选择的不是一个可用的PNG文件");
		}
		
		private function pngLoaderSecurityErrorHandler(event:SecurityErrorEvent):void
		{
			errorCallbackInvoke();
			Alert.show(event.text, "读取PNG图片文件时发生沙箱异常");
		}
		
		private function errorCallbackInvoke():void
		{
			if(_input.errorCallback != null)
			{
				_input.errorCallback();
			}
		}
	}
}