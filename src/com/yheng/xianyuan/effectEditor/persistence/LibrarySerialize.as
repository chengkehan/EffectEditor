package com.yheng.xianyuan.effectEditor.persistence
{
	import com.codeTooth.actionscript.lang.exceptions.NullPointerException;
	import com.codeTooth.actionscript.lang.utils.ByteArrayUtil;
	import com.yheng.xianyuan.effectEditor.data.EffectTemplateData;
	
	import flash.utils.ByteArray;

	public class LibrarySerialize
	{
		public function serialize(buffer:ByteArray, version:uint, effectTemplates:Vector.<EffectTemplateData>):void
		{
			if(buffer == null)
			{
				throw new NullPointerException("Null input buffer parameter.");
			}
			if(effectTemplates == null)
			{
				throw new NullPointerException("Null input effectTemplates parameters.");
			}
			
			buffer.writeUnsignedInt(version);
			buffer.writeUnsignedInt(effectTemplates.length);
			for each(var effectTmpl:EffectTemplateData in effectTemplates)
			{
				serializeEffectTemplate(buffer, effectTmpl);
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