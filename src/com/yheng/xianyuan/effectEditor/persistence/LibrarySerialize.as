package com.yheng.xianyuan.effectEditor.persistence
{
	import com.codeTooth.actionscript.lang.exceptions.NullPointerException;
	import com.codeTooth.actionscript.lang.utils.ByteArrayUtil;
	import com.yheng.xianyuan.effectEditor.core.Mediator;
	import com.yheng.xianyuan.effectEditor.core.effectEditor_internal;
	
	import flash.utils.ByteArray;
	import com.yheng.xianyuan.effectEditor.data.EffectTemplateData;

	public class LibrarySerialize
	{
		use namespace effectEditor_internal;
		
		public function serialise(buffer:ByteArray):void
		{
			if(buffer == null)
			{
				throw new NullPointerException("Null input buffer parameter.");
			}
			
			// Write effectTemplates
			var effectTemplates:Vector.<EffectTemplateData> = Mediator.data.getEffectTemplatesData();
			buffer.writeUnsignedInt(effectTemplates.length);
			for each(var effectTemplate:EffectTemplateData in effectTemplates)
			{
				serializeEffectTemplate(buffer, effectTemplate);
			}
		}
		
		private function serializeEffectTemplate(buffer:ByteArray, effectTemplate:EffectTemplateData):void
		{
			buffer.writeDouble(effectTemplate.id);
			ByteArrayUtil.writeStringAt(buffer, effectTemplate.name, buffer.position);
			ByteArrayUtil.writeByteArrayAt(buffer, effectTemplate.bytes, buffer.position);
			ByteArrayUtil.writeStringAt(buffer, effectTemplate.sparrow.toXMLString(), buffer.position);
		}
	}
}