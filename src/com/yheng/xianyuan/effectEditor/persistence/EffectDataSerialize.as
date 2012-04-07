package com.yheng.xianyuan.effectEditor.persistence
{
	import com.codeTooth.actionscript.lang.exceptions.NullPointerException;
	import com.codeTooth.actionscript.lang.utils.ByteArrayUtil;
	import com.yheng.xianyuan.effectEditor.command.CommandID;
	import com.yheng.xianyuan.effectEditor.command.GetEffectTemplateCommandData;
	import com.yheng.xianyuan.effectEditor.core.Mediator;
	import com.yheng.xianyuan.effectEditor.core.effectEditor_internal;
	import com.yheng.xianyuan.effectEditor.data.EffectData;
	import com.yheng.xianyuan.effectEditor.data.EffectTemplateData;
	
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;

	public class EffectDataSerialize
	{
		use namespace effectEditor_internal;
		
		private var _templateIDs:Dictionary = null;
		
		public function EffectDataSerialize()
		{
		}
		
		public function serialize(buffer:ByteArray):void
		{
			if(buffer == null)
			{
				throw new NullPointerException("Null input buffer parameter.");
			}
			
			_templateIDs = new Dictionary();
			
			var effectBytes:ByteArray = new ByteArray();
			var effects:Vector.<EffectData> = Mediator.data.getEffectsData();
			var numEffectTemplates:uint = 0;
			effectBytes.writeUnsignedInt(effects.length);
			for each(var effect:EffectData in effects)
			{
				effectBytes.writeDouble(effect.id);
				effectBytes.writeDouble(effect.templateID);
				effectBytes.writeInt(effect.emptyFramesPrefix);
				effectBytes.writeInt(effect.emptyFramesSuffix);
				effectBytes.writeInt(effect.origionX);
				effectBytes.writeInt(effect.origionY);
				
				if(_templateIDs[effect.templateID] == null)
				{
					_templateIDs[effect.templateID] = effect.templateID;
					numEffectTemplates++;
				}
			}
			
			buffer.writeUnsignedInt(numEffectTemplates);
			for each(var templateID:Number in _templateIDs)
			{
				var effectTemplate:EffectTemplateData = Mediator.commands.executeCommand(CommandID.GET_EFFECT_TEMPLATE, new GetEffectTemplateCommandData(templateID));
				buffer.writeDouble(effectTemplate.id);
				ByteArrayUtil.writeStringAt(buffer, effectTemplate.name, buffer.position);
				ByteArrayUtil.writeStringAt(buffer, effectTemplate.sparrow.toXMLString(), buffer.position);
			}
			
			buffer.writeBytes(effectBytes);
		}
	}
}