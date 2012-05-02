package com.yheng.xianyuan.effectEditor.persistence
{
	import com.codeTooth.actionscript.lang.exceptions.NullPointerException;
	import com.codeTooth.actionscript.lang.utils.ByteArrayUtil;
	import com.codeTooth.actionscript.lang.utils.Common;
	import com.yheng.xianyuan.effectEditor.command.CommandID;
	import com.yheng.xianyuan.effectEditor.command.GetEffectTemplateCommandData;
	import com.yheng.xianyuan.effectEditor.core.Mediator;
	import com.yheng.xianyuan.effectEditor.core.effectEditor_internal;
	import com.yheng.xianyuan.effectEditor.data.Data;
	import com.yheng.xianyuan.effectEditor.data.EffectData;
	import com.yheng.xianyuan.effectEditor.data.EffectTemplateData;
	
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;

	public class StageEffectSerialize
	{
		use namespace effectEditor_internal;
		
		public function StageEffectSerialize()
		{
		}
		
		public function serialize(buffer:ByteArray):void
		{
			if(buffer == null)
			{
				throw new NullPointerException("Null input buffer parameter.");
			}
			
			var data:Data = Mediator.data;
			
			buffer.writeUnsignedInt(data.version);
			ByteArrayUtil.writeStringAt(buffer, data.getName(), buffer.position);
			buffer.writeUnsignedInt(data.getFPS());
			ByteArrayUtil.writeStringAt(buffer, Common.EMPTY_STRING, buffer.position);
			serializeEffectTemplates(buffer, data.getEffectsData());
			serializeEffects(buffer, data.getEffectsData());
		}
		
		private function serializeEffectTemplates(buffer:ByteArray, effects:Vector.<EffectData>):void
		{
			var usefulEffectTemplates:Dictionary = new Dictionary();
			var usefulEffectTemplatesCount:uint = 0;
			var effectTemplate:EffectTemplateData = null;
			for each(var effect:EffectData in effects)
			{
				effectTemplate = Mediator.commands.executeCommand(CommandID.GET_EFFECT_TEMPLATE, new GetEffectTemplateCommandData(effect.templateID));
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
			}
		}
	}
}