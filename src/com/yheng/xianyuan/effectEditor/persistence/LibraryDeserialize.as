package com.yheng.xianyuan.effectEditor.persistence
{
	import com.codeTooth.actionscript.lang.exceptions.NullPointerException;
	import com.codeTooth.actionscript.lang.utils.ByteArrayUtil;
	import com.yheng.xianyuan.effectEditor.command.AddEffectTemplateCommandData;
	import com.yheng.xianyuan.effectEditor.command.CommandID;
	import com.yheng.xianyuan.effectEditor.command.ContainsEffectTemplateCommandData;
	import com.yheng.xianyuan.effectEditor.core.Mediator;
	
	import flash.utils.ByteArray;
	
	import mx.controls.Alert;

	public class LibraryDeserialize
	{
		private var _numEffectTemplates:uint = 0;
		
		private var _effectTemplateIndex:int = 0;
		
		private var _buffer:ByteArray = null;
		
		private var _completeCallback:Function = null;
		
		public function deserialize(buffer:ByteArray, completeCallback:Function = null):void
		{
			if(buffer == null)
			{
				throw new NullPointerException("Null input buffer parameter.");
			}
			_buffer = buffer;
			_completeCallback = completeCallback;
			_effectTemplateIndex = 0;
			
			// version
			buffer.readUnsignedInt();
			
			_numEffectTemplates = buffer.readUnsignedInt();
			deserializeEffectTemplateCompleteCallback();
		}
		
		private function deserializeEffectTemplateCompleteCallback():void
		{
			if(_effectTemplateIndex++ >= _numEffectTemplates)
			{
				if(_completeCallback != null)
				{
					_completeCallback();
				}
			}
			else
			{
				deserializeEffectTemplate(_buffer);
			}
		}
		
		private function deserializeEffectTemplate(buffer:ByteArray):void
		{
			var id:Number = buffer.readDouble();
			var name:String = ByteArrayUtil.readStringAt(buffer, buffer.position);
			var bytes:ByteArray = ByteArrayUtil.readByteArrayAt(buffer, buffer.position);
			var sparrow:XML = new XML(ByteArrayUtil.readStringAt(buffer, buffer.position));
			
			if(Mediator.commands.executeCommand(CommandID.CONTAINS_EFFECT_TEMPLATE, new ContainsEffectTemplateCommandData(id)))
			{
				Alert.show("特效库中已经存在相同的特效\"" + name + "\"，id\"" + id + "\".");
				deserializeEffectTemplateCompleteCallback();
			}
			else
			{
				Mediator.commands.executeCommand(CommandID.ADD_EFFECT_TEMPLATE, new AddEffectTemplateCommandData(id, name, bytes, sparrow, deserializeEffectTemplateCompleteCallback));
			}
		}
	}
}