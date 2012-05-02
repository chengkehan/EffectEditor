package com.yheng.xianyuan.effectEditor.persistence
{
	import com.codeTooth.actionscript.lang.exceptions.NullPointerException;
	import com.codeTooth.actionscript.lang.utils.ByteArrayUtil;
	import com.yheng.xianyuan.effectEditor.data.EffectData;
	import com.yheng.xianyuan.effectEditor.data.EffectTemplateData;
	import com.yheng.xianyuan.effectEditor.data.StageEffectData;
	
	import flash.utils.ByteArray;

	public class StageEffectDeserialize
	{
		public function StageEffectDeserialize()
		{
		}
		
		public function deserialize(buffer:ByteArray):StageEffectData
		{
			if(buffer == null)
			{
				throw new NullPointerException("Null input buffer parameter.");
			}
			
			var stageEffect:StageEffectData = new StageEffectData();
			// version
			buffer.readUnsignedInt();
			stageEffect.name = ByteArrayUtil.readStringAt(buffer, buffer.position);
			stageEffect.fps = buffer.readUnsignedInt();
			stageEffect.data = ByteArrayUtil.readStringAt(buffer, buffer.position);
			deserializeEffectTemplates(buffer, stageEffect);
			deserializeEffect(buffer, stageEffect);
			
			return stageEffect;
		}
		
		private function deserializeEffectTemplates(buffer:ByteArray, stageEffect:StageEffectData):void
		{
			var size:uint = buffer.readUnsignedInt();
			stageEffect.effectTemplates = new Vector.<EffectTemplateData>();
			for (var i:int = 0; i < size; i++) 
			{
				var id:Number = buffer.readDouble();
				var name:String = ByteArrayUtil.readStringAt(buffer, buffer.position);
				var bytes:ByteArray = ByteArrayUtil.readByteArrayAt(buffer, buffer.position);
				var sparrow:XML = XML(ByteArrayUtil.readStringAt(buffer, buffer.position));
				var effectTempalte:EffectTemplateData = new EffectTemplateData(id, name, null, bytes, sparrow);
				stageEffect.effectTemplates.push(effectTempalte);
			}
		}
		
		private function deserializeEffect(buffer:ByteArray, stageEffect:StageEffectData):void
		{
			var size:uint = buffer.readUnsignedInt();
			stageEffect.effects = new Vector.<EffectData>();
			for (var i:int = 0; i < size; i++) 
			{
				var id:Number = buffer.readDouble();
				var templateID:Number = buffer.readDouble();
				var origionX:int = buffer.readInt();
				var origionY:int = buffer.readInt();
				var prefix:int = buffer.readInt();
				var suffix:int = buffer.readInt();
				var effect:EffectData = new EffectData(id, templateID, origionX, origionY, prefix, suffix);
				stageEffect.effects.push(effect);
			}
		}
	}
}