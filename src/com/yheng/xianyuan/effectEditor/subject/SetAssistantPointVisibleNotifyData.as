package com.yheng.xianyuan.effectEditor.subject
{
	import com.codeTooth.actionscript.patterns.subject.NotifyData;
	
	public class SetAssistantPointVisibleNotifyData extends NotifyData
	{
		public var visible:Boolean = false;
		
		public function SetAssistantPointVisibleNotifyData(visible:Boolean)
		{
			this.visible = visible;
		}
	}
}