package com.yheng.xianyuan.effectEditor.persistence
{
	import com.codeTooth.actionscript.display.Effect;
	import com.codeTooth.actionscript.lang.exceptions.NullPointerException;
	import com.codeTooth.actionscript.lang.utils.ByteArrayUtil;
	import com.yheng.xianyuan.effectEditor.core.Mediator;
	import com.yheng.xianyuan.effectEditor.core.effectEditor_internal;
	
	import flash.utils.ByteArray;
	import com.yheng.xianyuan.effectEditor.data.Data;
	import com.yheng.xianyuan.effectEditor.data.EffectData;
	import com.yheng.xianyuan.effectEditor.data.EffectTemplateData;
	import com.yheng.xianyuan.effectEditor.data.ReferenceObjectData;

	public class DataSerialize
	{
		use namespace effectEditor_internal;
		
		public function serialize(buffer:ByteArray):void
		{
			if(buffer == null)
			{
				throw new NullPointerException("Null input buffer parameter.");
			}
			
			var data:Data = Mediator.data;
			
			buffer.writeUnsignedInt(data.version);
			ByteArrayUtil.writeStringAt(buffer, data.getName(), buffer.position);
			buffer.writeBoolean(data.getPlaying());
			buffer.writeBoolean(data.getAssistantPointVisible());
			buffer.writeUnsignedInt(data.getWorkspaceColor());
			buffer.writeUnsignedInt(data.getFPS());
			serializeReferenceObject(buffer, data.getReferenceObjectData());
			serializeEffectTemplates(buffer, data.getEffectTemplatesData());
			serializeEffects(buffer, data.getEffectsData());
		}
		
		private function serializeReferenceObject(buffer:ByteArray, refObj:ReferenceObjectData):void
		{
			buffer.writeInt(refObj.x);
			buffer.writeInt(refObj.y);
			ByteArrayUtil.writeByteArrayAt(buffer, refObj.bytes, buffer.position);
		}
		
		private function serializeEffectTemplates(buffer:ByteArray, effectTemplates:Vector.<EffectTemplateData>):void
		{
			buffer.writeUnsignedInt(effectTemplates.length);
			for each(var effectTemplate:EffectTemplateData in effectTemplates)
			{
				serializeEffectTemplate(buffer, effectTemplate);
			}
		}
		
		private function serializeEffects(buffer:ByteArray, effects:Vector.<EffectData>):void
		{
			buffer.writeUnsignedInt(effects.length);
			for each(var effect:EffectData in effects)
			{
				serializeEffect(buffer, effect);
			}
		}
		
		private function serializeEffectTemplate(buffer:ByteArray, effectTemplate:EffectTemplateData):void
		{
			buffer.writeDouble(effectTemplate.id);
			ByteArrayUtil.writeStringAt(buffer, effectTemplate.name, buffer.position);
			ByteArrayUtil.writeByteArrayAt(buffer, effectTemplate.bytes, buffer.position);
			ByteArrayUtil.writeStringAt(buffer, effectTemplate.sparrow.toXMLString(), buffer.position);
		}
		
		private function serializeEffect(buffer:ByteArray, effect:EffectData):void
		{
			buffer.writeDouble(effect.id);
			buffer.writeDouble(effect.templateID);
			buffer.writeInt(effect.origionX);
			buffer.writeInt(effect.origionY);
			buffer.writeInt(effect.emptyFramesPrefix);
			buffer.writeInt(effect.emptyFramesSuffix);
		}
	}
}