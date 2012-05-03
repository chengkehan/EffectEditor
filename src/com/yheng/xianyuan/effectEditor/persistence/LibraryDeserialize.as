package com.yheng.xianyuan.effectEditor.persistence
{
	import com.codeTooth.actionscript.lang.exceptions.NullPointerException;
	import com.codeTooth.actionscript.lang.utils.ByteArrayUtil;
	import com.yheng.xianyuan.effectEditor.data.EffectTemplateData;
	
	import flash.utils.ByteArray;

	public class LibraryDeserialize
	{
		public function deserialize(buffer:ByteArray, effectTemplates:Vector.<EffectTemplateData>):void
		{
			if(buffer == null)
			{
				throw new NullPointerException("Null input buffer parameter.");
			}
			if(effectTemplates == null)
			{
				throw new NullPointerException("Null input effectTemplates parameter.");
			}
			
			var version:uint = buffer.readUnsignedInt();
			var numEffectTmpls:uint = buffer.readUnsignedInt();
			for (var i:int = 0; i < numEffectTmpls; i++) 
			{
				deserializeEffectTemplate(buffer, effectTemplates);
			}
		}
		
		private function deserializeEffectTemplate(buffer:ByteArray, effectTmpls:Vector.<EffectTemplateData>):void
		{
			var id:Number = buffer.readDouble();
			var name:String = ByteArrayUtil.readStringAt(buffer, buffer.position);
			var bytes:ByteArray = ByteArrayUtil.readByteArrayAt(buffer, buffer.position);
			var sparrow:XML = new XML(ByteArrayUtil.readStringAt(buffer, buffer.position));
			var tmpl:EffectTemplateData = new EffectTemplateData(id, name, null, bytes, sparrow);
			effectTmpls.push(tmpl);
		}
	}
}