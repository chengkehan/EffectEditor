package com.yheng.xianyuan.effectEditor.persistence
{
	import com.codeTooth.actionscript.lang.exceptions.NullPointerException;
	
	import flash.utils.ByteArray;

	public class ImageSerialize
	{
		public function ImageSerialize()
		{
		}
		
		public function serialize(buffer:ByteArray, imageBytes:ByteArray, id:Number):void
		{
			if(buffer == null)
			{
				throw new NullPointerException("Null input buffer parameter.");
			}
			if(imageBytes == null)
			{
				throw new NullPointerException("Null input imageBytes parameter.");
			}
			
			buffer.writeUnsignedInt(imageBytes.length);
			buffer.writeBytes(imageBytes);
			buffer.writeDouble(id);
		}
	}
}