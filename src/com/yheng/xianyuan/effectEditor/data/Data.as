package com.yheng.xianyuan.effectEditor.data
{
	import com.yheng.xianyuan.effectEditor.core.effectEditor_internal;

	public class Data
	{
		// 参照物
		private var _referenceObjectData:ReferenceObjectData = null;
		
		// 特效模板数据
		private var _effectTemplatesData:Vector.<EffectTemplateData> = null;
		
		// 特效数据
		private var _effectsData:Vector.<EffectData> = null;
		
		private var _workspaceColor:uint = 0x000000;
		
		private var _playing:Boolean = true;
		
		private var _assistantPointVisible:Boolean = true;
		
		private var _fps:int = 30;
		
		private var _name:String = "";
		
		private var _version:uint = 1;
		
		public function Data()
		{
			_effectTemplatesData = new Vector.<EffectTemplateData>();
			_effectsData = new Vector.<EffectData>();
			_referenceObjectData = new ReferenceObjectData();
		}
		
		public function get version():uint
		{
			return _version;
		}
		
		effectEditor_internal function getReferenceObjectData():ReferenceObjectData
		{
			return _referenceObjectData;
		}
		
		effectEditor_internal function setName(name:String):void
		{
			_name = name;
		}
		effectEditor_internal function getName():String
		{
			return _name;
		}
		
		effectEditor_internal function getEffectTemplatesData():Vector.<EffectTemplateData>
		{
			return _effectTemplatesData;
		}
		
		effectEditor_internal function getEffectsData():Vector.<EffectData>
		{
			return _effectsData;
		}
		
		effectEditor_internal function getWorkspaceColor():uint
		{
			return _workspaceColor;
		}
		
		effectEditor_internal function setWorkspaceColor(value:uint):void
		{
			_workspaceColor = value;
		}
		
		effectEditor_internal function setPlaying(value:Boolean):void
		{
			_playing = value;
		}
		
		effectEditor_internal function getPlaying():Boolean
		{
			return _playing;
		}
		
		effectEditor_internal function setAssistantPointVisible(bool:Boolean):void
		{
			_assistantPointVisible = bool;
		}
		effectEditor_internal function getAssistantPointVisible():Boolean
		{
			return _assistantPointVisible;
		}
		
		effectEditor_internal function setFPS(value:int):void
		{
			_fps = value;
		}
		effectEditor_internal function getFPS():int
		{
			return _fps;
		}
		
		effectEditor_internal function reset():void
		{
			_effectTemplatesData = new Vector.<EffectTemplateData>();
			_effectsData = new Vector.<EffectData>();
			_referenceObjectData = new ReferenceObjectData();
		}
	}
}