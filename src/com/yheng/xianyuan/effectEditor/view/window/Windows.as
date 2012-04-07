package com.yheng.xianyuan.effectEditor.view.window
{
	import com.codeTooth.actionscript.lang.exceptions.IllegalOperationException;
	import com.codeTooth.actionscript.lang.exceptions.NullPointerException;
	import com.codeTooth.actionscript.patterns.subject.INofityData;
	import com.codeTooth.actionscript.patterns.subject.IObserver;
	import com.yheng.xianyuan.effectEditor.core.Mediator;
	import com.yheng.xianyuan.effectEditor.subject.SubjectID;
	import com.yheng.xianyuan.effectEditor.view.window.importEffectWindow.ImportEffectWindow;
	
	import flash.display.DisplayObject;
	
	import mx.managers.PopUpManager;

	public class Windows implements IObserver
	{
		public function Windows()
		{
		}
		
		//------------------------------------------------------------------------------------------------------------------------------
		// 初始化
		//------------------------------------------------------------------------------------------------------------------------------
		
		private var _initialized:Boolean = false;
		
		private var _container:DisplayObject = null;
		
		public function initialize(container:DisplayObject):void
		{
			if(_initialized)
			{
				return;
			}
			if(container == null)
			{
				throw new NullPointerException("Null input container parameter.");
			}
			
			_initialized = true;
			_container = container;
			Mediator.subjects.followSubject(this, SubjectID.SHOW_IMPORT_EFFECT_WINDOW);
			Mediator.subjects.followSubject(this, SubjectID.HIDE_IMPORT_EFFECT_WINDOW);
		}
		
		//------------------------------------------------------------------------------------------------------------------------------
		// 实现 IObserver 接口
		//------------------------------------------------------------------------------------------------------------------------------
		
		public function update(data:INofityData=null):void
		{
			switch(data.getSubjectID())
			{
				case SubjectID.SHOW_IMPORT_EFFECT_WINDOW:
				{
					showImportEffectWindow();
					break;
				}
				case SubjectID.HIDE_IMPORT_EFFECT_WINDOW:
				{
					hideImportEffectWindow();
					break;
				}
					
				default:
				{
					throw new IllegalOperationException();
					break;
				}
			}
		}
		
		//------------------------------------------------------------------------------------------------------------------------------
		// Windows
		//------------------------------------------------------------------------------------------------------------------------------
		
		private var _importEffectWindow:ImportEffectWindow = null;
		
		private function showImportEffectWindow():void
		{
			if(_importEffectWindow == null)
			{
				_importEffectWindow = new ImportEffectWindow();
				PopUpManager.addPopUp(_importEffectWindow, _container);
				PopUpManager.centerPopUp(_importEffectWindow);
			}
			else
			{
				PopUpManager.addPopUp(_importEffectWindow, _container);
			}
		}
		
		private function hideImportEffectWindow():void
		{
			if(_importEffectWindow != null)
			{
				PopUpManager.removePopUp(_importEffectWindow);
			}
		}
	}
}