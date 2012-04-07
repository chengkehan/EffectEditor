package com.yheng.xianyuan.effectEditor.persistence
{
	import com.codeTooth.actionscript.lang.exceptions.NullPointerException;
	import com.codeTooth.actionscript.lang.utils.ByteArrayUtil;
	import com.yheng.xianyuan.effectEditor.command.AddEffectCommandData;
	import com.yheng.xianyuan.effectEditor.command.AddEffectTemplateCommandData;
	import com.yheng.xianyuan.effectEditor.command.CommandID;
	import com.yheng.xianyuan.effectEditor.command.MoveReferenceObjectCommandData;
	import com.yheng.xianyuan.effectEditor.command.SetAssistantPointVisibleCommandData;
	import com.yheng.xianyuan.effectEditor.command.SetFPSCommandData;
	import com.yheng.xianyuan.effectEditor.command.SetNameCommandData;
	import com.yheng.xianyuan.effectEditor.command.SetPlayingCommandData;
	import com.yheng.xianyuan.effectEditor.command.SetReferenceObjectCommandData;
	import com.yheng.xianyuan.effectEditor.command.SetWorkspaceColorCommandData;
	import com.yheng.xianyuan.effectEditor.core.Mediator;
	import com.yheng.xianyuan.effectEditor.core.effectEditor_internal;
	
	import flash.utils.ByteArray;
	import com.yheng.xianyuan.effectEditor.data.Data;

	public class DataDeserialize
	{
		use namespace effectEditor_internal;
		
		private var _numEffectTemplates:uint = 0;
		private var _effectTemplateIndex:int = 0;
		
		private var _buffer:ByteArray = null;
		
		public function deserialize(buffer:ByteArray):void
		{
			if(buffer == null)
			{
				throw new NullPointerException("Null input buffer parameter.");
			}
			_buffer = buffer;
			_numEffectTemplates = 0;
			_effectTemplateIndex = 0;
			
			var data:Data = Mediator.data;
			
			var version:uint = buffer.readUnsignedInt();
			
			var name:String = ByteArrayUtil.readStringAt(buffer, buffer.position);
			Mediator.commands.executeCommand(CommandID.SET_NAME, new SetNameCommandData(name));
			
			var playing:Boolean = buffer.readBoolean();
			Mediator.commands.executeCommand(CommandID.SET_PLAYING, new SetPlayingCommandData(playing));
			
			var assistantPointVisible:Boolean = buffer.readBoolean();
			Mediator.commands.executeCommand(CommandID.SET_ASSISTANT_POINT_VISIBLE, new SetAssistantPointVisibleCommandData(assistantPointVisible));
			
			var bgColor:uint = buffer.readUnsignedInt();
			Mediator.commands.executeCommand(CommandID.SET_WORKSPACE_COLOR, new SetWorkspaceColorCommandData(bgColor));
			
			var fps:int = buffer.readUnsignedByte();
			Mediator.commands.executeCommand(CommandID.SET_FPS, new SetFPSCommandData(fps));
			
			deserializeReferenceObject(buffer);
			
			deserializeEffectTemplates(buffer);
		}
		
		private function deserializeReferenceObject(buffer:ByteArray):void
		{
			var x:int = buffer.readInt();
			var y:int = buffer.readInt();
			var bytes:ByteArray = ByteArrayUtil.readByteArrayAt(buffer, buffer.position);
			if(bytes != null)
			{
				Mediator.commands.executeCommand(CommandID.SET_REFERENCE_OBJECT, new SetReferenceObjectCommandData(bytes));
				Mediator.commands.executeCommand(CommandID.MOVE_REFERENCE_OBJECT, new MoveReferenceObjectCommandData(x, y));
			}
		}
		
		private function deserializeEffectTemplates(buffer:ByteArray):void
		{
			_numEffectTemplates = buffer.readUnsignedInt();
			deserializeEffectTemplateCompleteCallback();
		}
		
		private function deserializeEffects(buffer:ByteArray):void
		{
			var length:uint = buffer.readUnsignedInt();
			for (var i:int = 0; i < length; i++) 
			{
				deserializeEffect(buffer);
			}
		}
		
		private function deserializeEffectTemplateCompleteCallback():void
		{
			if(_effectTemplateIndex >= _numEffectTemplates)
			{
				deserializeEffects(_buffer);
			}
			else
			{
				deserializeEffectTemplate(_buffer);
				_effectTemplateIndex++;
			}
		}
		
		private function deserializeEffectTemplate(buffer:ByteArray):void
		{
			var id:Number = buffer.readDouble();
			var name:String = ByteArrayUtil.readStringAt(buffer, buffer.position);
			var bytes:ByteArray = ByteArrayUtil.readByteArrayAt(buffer, buffer.position);
			var sparrow:XML = new XML(ByteArrayUtil.readStringAt(buffer, buffer.position));
			Mediator.commands.executeCommand(CommandID.ADD_EFFECT_TEMPLATE, new AddEffectTemplateCommandData(id, name, bytes, sparrow, deserializeEffectTemplateCompleteCallback));
		}
		
		private function deserializeEffect(buffer:ByteArray):void
		{
			var id:Number = buffer.readDouble();
			var tmplID:Number = buffer.readDouble();
			var origX:int = buffer.readInt();
			var origY:int = buffer.readInt();
			var prefix:int = buffer.readInt();
			var suffix:int = buffer.readInt();
			Mediator.commands.executeCommand(CommandID.ADD_EFFECT, new AddEffectCommandData(tmplID, id, origX, origY, prefix, suffix));
		}
	}
}