package com.yheng.xianyuan.effectEditor.persistence
{
	import com.codeTooth.actionscript.lang.exceptions.NullPointerException;
	import com.codeTooth.actionscript.lang.utils.ByteArrayUtil;
	import com.yheng.xianyuan.effectEditor.core.Mediator;
	import com.yheng.xianyuan.effectEditor.core.effectEditor_internal;
	import com.yheng.xianyuan.effectEditor.data.Data;
	import com.yheng.xianyuan.effectEditor.data.EffectTemplateData;
	
	import flash.utils.ByteArray;

	public class LibrarySerialize
	{
		use namespace effectEditor_internal;
		
		public function serialise(buffer:ByteArray):void
		{
			if(buffer == null)
			{
				throw new NullPointerException("Null input buffer parameter.");
			}
			
			var data:Data = Mediator.data;
			
			buffer.writeUnsignedInt(data.version);
			
			// Write effectTemplates
			var effectTemplates:Vector.<EffectTemplateData> = data.getEffectTemplatesData();
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