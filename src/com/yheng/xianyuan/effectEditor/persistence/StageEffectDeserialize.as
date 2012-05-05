package com.yheng.xianyuan.effectEditor.persistence
{
	import com.codeTooth.actionscript.lang.exceptions.NullPointerException;
	import com.codeTooth.actionscript.lang.utils.ByteArrayUtil;
	import com.yheng.xianyuan.effectEditor.data.EffectData;
	import com.yheng.xianyuan.effectEditor.data.EffectTemplateData;
	import com.yheng.xianyuan.effectEditor.data.StageEffectData;
	
	import flash.utils.ByteArray;

	public class StageEffectDeserialize
	{
		public function StageEffectDeserialize()
		{
		}
		
		public function deserialize(buffer:ByteArray, stageEffect:StageEffectData):void
		{
			if(buffer == null)
			{
				throw new NullPointerException("Null input buffer parameter.");
			}
			if(stageEffect == null)
			{
				throw new NullPointerException("Null input stageEffect parameter.");
			}
			
			buffer.readUnsignedInt();
			stageEffect.name = ByteArrayUtil.readStringAt(buffer, buffer.position);
			stageEffect.fps = buffer.readUnsignedInt();
			stageEffect.data = ByteArrayUtil.readStringAt(buffer, buffer.position);
			deserializeEffectTemplates(buffer, stageEffect);
			deserializeEffect(buffer, stageEffect);
		}
		
		private function deserializeEffectTemplates(buffer:ByteArray, stageEffect:StageEffectData):void
		{
			var size:uint = buffer.readUnsignedInt();
			stageEffect.effectTemplates = new Vector.<EffectTemplateData>();
			for (var i:int = 0; i < size; i++) 
			{
				var id:Number = buffer.readDouble();
				var name:String = ByteArrayUtil.readStringAt(buffer, buffer.position);
				var bytes:ByteArray = ByteArrayUtil.readByteArrayAt(buffer, buffer.position);
				var sparrow:XML = XML(ByteArrayUtil.readStringAt(buffer, buffer.position));
				var effectTempalte:EffectTemplateData = new EffectTemplateData(id, name, null, bytes, sparrow);
				stageEffect.effectTemplates.push(effectTempalte);
			}
		}
		
		private function deserializeEffect(buffer:ByteArray, stageEffect:StageEffectData):void
		{
			var size:uint = buffer.readUnsignedInt();
			stageEffect.effects = new Vector.<EffectData>();
			for (var i:int = 0; i < size; i++) 
			{
				var id:Number = buffer.readDouble();
				var templateID:Number = buffer.readDouble();
				var origionX:int = buffer.readInt();
				var origionY:int = buffer.readInt();
				var prefix:int = buffer.readInt();
				var suffix:int = buffer.readInt();
				
				var a:Number = buffer.readDouble();
				var r:Number = buffer.readDouble();
				var g:Number = buffer.readDouble();
				var b:Number = buffer.readDouble();
				
				var aa:Number = buffer.readDouble();
				var ar:Number = buffer.readDouble();
				var ag:Number = buffer.readDouble();
				var ab:Number = buffer.readDouble();
				
				var ca:Number = buffer.readDouble();
				var cr:Number = buffer.readDouble();
				var cg:Number = buffer.readDouble();
				var cb:Number = buffer.readDouble();
				
				var l:Number = buffer.readDouble();
				
				var v1:Number = buffer.readDouble();
				var v2:Number = buffer.readDouble();
				var v3:Number = buffer.readDouble();
				var v4:Number = buffer.readDouble();
				
				var effect:EffectData = new EffectData(id, templateID, origionX, origionY, prefix, suffix, a, r, g, b, aa, ar, ag, ab, ca, cr, cg, cb, l, v1, v2, v3, v4);
				stageEffect.effects.push(effect);
			}
		}
	}
}