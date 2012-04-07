package com.yheng.xianyuan.effectEditor.subject
{
	import com.codeTooth.actionscript.patterns.subject.NotifyData;
	import com.yheng.xianyuan.effectEditor.data.ReferenceObjectData;
	
	public class SetReferenceObjectNotifyData extends NotifyData
	{
		public var referenceObjectData:ReferenceObjectData = null;
		
		public function SetReferenceObjectNotifyData(referenceObjectData:ReferenceObjectData)
		{
			this.referenceObjectData = referenceObjectData;
		}
	}
}