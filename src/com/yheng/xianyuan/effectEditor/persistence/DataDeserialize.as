package com.yheng.xianyuan.effectEditor.persistence
{
	import com.codeTooth.actionscript.lang.exceptions.NullPointerException;
	import com.codeTooth.actionscript.lang.utils.ByteArrayUtil;
	import com.yheng.xianyuan.effectEditor.core.effectEditor_internal;
	import com.yheng.xianyuan.effectEditor.data.Data;
	import com.yheng.xianyuan.effectEditor.data.EffectData;
	import com.yheng.xianyuan.effectEditor.data.EffectTemplateData;
	import com.yheng.xianyuan.effectEditor.data.ReferenceObjectData;
	
	import flash.utils.ByteArray;

	public class DataDeserialize
	{
		use namespace effectEditor_internal;
		
		private var _buffer:ByteArray = null;
		
		private var _dataCache:Data = null;
		
		public function deserialize(buffer:ByteArray, dataCache:Data):void
		{
			if(buffer == null)
			{
				throw new NullPointerException("Null input buffer parameter.");
			}
			if(dataCache == null)
			{
				throw new NullPointerException("Null input data parameter.");
			}
			
			_buffer = buffer;
			_dataCache = dataCache;
			
			var version:uint = buffer.readUnsignedInt();
			
			var name:String = ByteArrayUtil.readStringAt(buffer, buffer.position);
			dataCache.setName(name);
			
			var playing:Boolean = buffer.readBoolean();
			dataCache.setPlaying(playing);
			
			var assistantPointVisible:Boolean = buffer.readBoolean();
			dataCache.setAssistantPointVisible(assistantPointVisible);
			
			var bgColor:uint = buffer.readUnsignedInt();
			dataCache.setWorkspaceColor(bgColor);
			
			var fps:uint = buffer.readUnsignedInt();
			dataCache.setFPS(fps);
			
			deserializeReferenceObject(buffer);
			deserializeEffectTemplates(buffer);
			deserializeEffects(buffer);
		}
		
		private function deserializeReferenceObject(buffer:ByteArray):void
		{
			var x:int = buffer.readInt();
			var y:int = buffer.readInt();
			var bytes:ByteArray = ByteArrayUtil.readByteArrayAt(buffer, buffer.position);
			
			var refData:ReferenceObjectData = new ReferenceObjectData();
			refData.setX(x);
			refData.setY(y);
			refData.setBytes(bytes);
			_dataCache.setReferenceObjectData(refData);
		}
		
		private function deserializeEffectTemplates(buffer:ByteArray):void
		{
			var numEffectTemplates:uint = buffer.readUnsignedInt();
			for (var i:int = 0; i < numEffectTemplates; i++) 
			{
				deserializeEffectTemplate(buffer);
			}
		}
		
		private function deserializeEffects(buffer:ByteArray):void
		{
			var length:uint = buffer.readUnsignedInt();
			for (var i:int = 0; i < length; i++) 
			{
				deserializeEffect(buffer);
			}
		}
		
		private function deserializeEffectTemplate(buffer:ByteArray):void
		{
			var id:Number = buffer.readDouble();
			var name:String = ByteArrayUtil.readStringAt(buffer, buffer.position);
			var bytes:ByteArray = ByteArrayUtil.readByteArrayAt(buffer, buffer.position);
			var sparrow:XML = new XML(ByteArrayUtil.readStringAt(buffer, buffer.position));
			var tmplData:EffectTemplateData = new EffectTemplateData(id, name, null, bytes, sparrow);
			_dataCache.getEffectTemplatesData().push(tmplData);
		}
		
		private function deserializeEffect(buffer:ByteArray):void
		{
			var id:Number = buffer.readDouble();
			var tmplID:Number = buffer.readDouble();
			var origX:int = buffer.readInt();
			var origY:int = buffer.readInt();
			var prefix:int = buffer.readInt();
			var suffix:int = buffer.readInt();
			var effectData:EffectData = new EffectData(id, tmplID, origX, origY, prefix, suffix);
			_dataCache.getEffectsData().push(effectData);
		}
	}
}