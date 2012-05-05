package com.yheng.xianyuan.effectEditor.persistence
{
	import com.codeTooth.actionscript.lang.exceptions.NoSuchObjectException;
	import com.codeTooth.actionscript.lang.exceptions.NullPointerException;
	import com.codeTooth.actionscript.lang.utils.ByteArrayUtil;
	import com.yheng.xianyuan.effectEditor.data.EffectData;
	import com.yheng.xianyuan.effectEditor.data.EffectTemplateData;
	import com.yheng.xianyuan.effectEditor.data.StageEffectData;
	
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;

	public class StageEffectSerialize
	{
		public function StageEffectSerialize()
		{
		}
		
		public function serialize(buffer:ByteArray, version:uint, stageEffect:StageEffectData):void
		{
			if(buffer == null)
			{
				throw new NullPointerException("Null input buffer parameter.");
			}
			if(stageEffect == null)
			{
				throw new NullPointerException("Null input stageEffect parameter.");
			}
			if(stageEffect.effectTemplates == null)
			{
				throw new NullPointerException("Null input stageEffect effectTemplates parameter.");
			}
			if(stageEffect.effects == null)
			{
				throw new NullPointerException("Null input stageEffect effects parameter.");
			}
			
			buffer.writeUnsignedInt(version);
			ByteArrayUtil.writeStringAt(buffer, stageEffect.name, buffer.position);
			buffer.writeUnsignedInt(stageEffect.fps);
			ByteArrayUtil.writeStringAt(buffer, stageEffect.data, buffer.position);
			serializeEffectTemplates(buffer, stageEffect.effectTemplates, stageEffect.effects);
			serializeEffects(buffer, stageEffect.effects);
		}
		
		private function serializeEffectTemplates(buffer:ByteArray, effectTemplates:Vector.<EffectTemplateData>, effects:Vector.<EffectData>):void
		{
			var usefulEffectTemplates:Dictionary = new Dictionary();
			var usefulEffectTemplatesCount:uint = 0;
			var effectTemplate:EffectTemplateData = null;
			for each(var effect:EffectData in effects)
			{
				effectTemplate = getEffectTemplate(effectTemplates, effect.templateID);
				if(usefulEffectTemplates[effectTemplate.id] == null)
				{
					usefulEffectTemplates[effectTemplate.id] = effectTemplate;
					usefulEffectTemplatesCount++;
				}
			}
			
			buffer.writeUnsignedInt(usefulEffectTemplatesCount);
			for each(effectTemplate in usefulEffectTemplates)
			{
				buffer.writeDouble(effectTemplate.id);
				ByteArrayUtil.writeStringAt(buffer, effectTemplate.name, buffer.position);
				ByteArrayUtil.writeByteArrayAt(buffer, effectTemplate.bytes, buffer.position);
				ByteArrayUtil.writeStringAt(buffer, effectTemplate.sparrow.toXMLString(), buffer.position);
			}
		}
		
		private function serializeEffects(buffer:ByteArray, effects:Vector.<EffectData>):void
		{
			buffer.writeUnsignedInt(effects.length);
			for each(var effect:EffectData in effects)
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
		
		private function getEffectTemplate(tmpls:Vector.<EffectTemplateData>, tmplID:Number):EffectTemplateData
		{
			for each(var tmpl:EffectTemplateData in tmpls)
			{
				if(tmpl.id == tmplID)
				{
					return tmpl;
				}
			}
			
			throw new NoSuchObjectException("Cannot find the effectTemplate \"" + tmplID + "\"");
			return null;
		}
	}
}