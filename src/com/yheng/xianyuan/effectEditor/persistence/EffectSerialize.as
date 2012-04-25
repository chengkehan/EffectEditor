package com.yheng.xianyuan.effectEditor.persistence
{
	import com.codeTooth.actionscript.lang.exceptions.NullPointerException;
	import com.codeTooth.actionscript.lang.utils.ByteArrayUtil;
	import com.yheng.xianyuan.effectEditor.command.CommandID;
	import com.yheng.xianyuan.effectEditor.command.GetEffectTemplateCommandData;
	import com.yheng.xianyuan.effectEditor.core.Mediator;
	import com.yheng.xianyuan.effectEditor.core.effectEditor_internal;
	import com.yheng.xianyuan.effectEditor.data.Data;
	import com.yheng.xianyuan.effectEditor.data.EffectData;
	import com.yheng.xianyuan.effectEditor.data.EffectTemplateData;
	
	import flash.utils.ByteArray;

	public class EffectSerialize
	{
		use namespace effectEditor_internal;
		
		public function EffectSerialize()
		{
		}
		
		public function serialize(buffer:ByteArray):void
		{
			if(buffer == null)
			{
				throw new NullPointerException("Null input buffer parameter.");
			}
			
			var data:Data = Mediator.data;
			
			ByteArrayUtil.writeStringAt(buffer, data.getName(), buffer.position);
			buffer.writeByte(data.getFPS());
			serializeEffectTemplates(buffer, data.getEffectsData());
			serializeEffects(buffer, data.getEffectsData());
		}
		
		private function serializeEffectTemplates(buffer:ByteArray, effects:Vector.<EffectData>):void
		{
			var usefulEffectTemplates:Vector.<EffectTemplateData> = new Vector.<EffectTemplateData>();
			var effectTemplate:EffectTemplateData = null;
			for each(var effect:EffectData in effects)
			{
				effectTemplate = Mediator.commands.executeCommand(CommandID.GET_EFFECT_TEMPLATE, new GetEffectTemplateCommandData(effect.templateID));
				usefulEffectTemplates.push(effectTemplate);
			}
			
			buffer.writeUnsignedInt(usefulEffectTemplates.length);
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