package com.yheng.xianyuan.effectEditor.data
{
	import com.codeTooth.actionscript.lang.utils.destroy.IDestroy;

	public class StageEffectData implements IDestroy
	{
		private var _name:String = null;
		
		private var _fps:int = 0;
		
		private var _data:String = "";
		
		private var _effectTemplates:Vector.<EffectTemplateData> = null;
		
		private var _effects:Vector.<EffectData> = null;
		
		public function StageEffectData()
		{
		}
		
		public function get name():String
		{
			return _name;
		}

		public function set name(value:String):void
		{
			_name = value;
		}

		public function get fps():int
		{
			return _fps;
		}

		public function set fps(value:int):void
		{
			_fps = value;
		}
		
		public function get data():String
		{
			return _data;
		}

		public function set data(value:String):void
		{
			_data = value;
		}

		public function get effectTemplates():Vector.<EffectTemplateData>
		{
			return _effectTemplates;
		}

		public function set effectTemplates(value:Vector.<EffectTemplateData>):void
		{
			_effectTemplates = value;
		}

		public function get effects():Vector.<EffectData>
		{
			return _effects;
		}

		public function set effects(value:Vector.<EffectData>):void
		{
			_effects = value;
		}

		public function destroy():void
		{
			_effectTemplates = null;
			_effects = null;
		}

	}
}