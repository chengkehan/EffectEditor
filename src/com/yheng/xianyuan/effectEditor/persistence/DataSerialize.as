package com.yheng.xianyuan.effectEditor.persistence
{
	import com.codeTooth.actionscript.lang.exceptions.NullPointerException;
	import com.codeTooth.actionscript.lang.utils.ByteArrayUtil;
	import com.yheng.xianyuan.effectEditor.data.EffectData;
	import com.yheng.xianyuan.effectEditor.data.EffectTemplateData;
	import com.yheng.xianyuan.effectEditor.data.ReferenceObjectData;
	
	import flash.utils.ByteArray;

	public class DataSerialize
	{
		public function serialize(
			buffer:ByteArray, 
			version:uint, name:String, playing:Boolean, assistantPointVisible:Boolean, workspaceColor:uint, fps:uint, 
			referenceObjectData:ReferenceObjectData, effectTempaltesData:Vector.<EffectTemplateData>, effectsData:Vector.<EffectData>):void
		{
			if(buffer == null)
			{
				throw new NullPointerException("Null input buffer parameter.");
			}
			if(referenceObjectData == null)
			{
				throw new NullPointerException("Null input referenceObjectData parameter.");
			}
			if(effectTempaltesData == null)
			{
				throw new NullPointerException("Null input effectTempaltesData parameter.");
			}
			if(effectsData == null)
			{
				throw new NullPointerException("Null input effectsData parameter.");
			}
			
			buffer.writeUnsignedInt(version);
			ByteArrayUtil.writeStringAt(buffer, name, buffer.position);
			buffer.writeBoolean(playing);
			buffer.writeBoolean(assistantPointVisible);
			buffer.writeUnsignedInt(workspaceColor);
			buffer.writeUnsignedInt(fps);
			serializeReferenceObject(buffer, referenceObjectData);
			serializeEffectTemplates(buffer, effectTempaltesData);
			serializeEffects(buffer, effectsData);
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
			
			buffer.writeDouble(effect.a);
			buffer.writeDouble(effect.r);
			buffer.writeDouble(effect.g);
			buffer.writeDouble(effect.b);
			
			buffer.writeDouble(effect.aa);
			buffer.writeDouble(effect.ar);
			buffer.writeDouble(effect.ag);
			buffer.writeDouble(effect.ab);
			
			buffer.writeDouble(effect.ca);
			buffer.writeDouble(effect.cr);
			buffer.writeDouble(effect.cg);
			buffer.writeDouble(effect.cb);
			
			buffer.writeDouble(effect.l);
			
			buffer.writeDouble(effect.v1);
			buffer.writeDouble(effect.v2);
			buffer.writeDouble(effect.v3);
			buffer.writeDouble(effect.v4);
		}
	}
}