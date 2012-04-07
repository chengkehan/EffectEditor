package com.yheng.xianyuan.effectEditor.subject
{
	import com.codeTooth.actionscript.patterns.subject.NotifyData;
	
	public class SetWorkspaceColorNotifyData extends NotifyData
	{
		public var color:uint = 0x000000;
		
		public function SetWorkspaceColorNotifyData(color:uint)
		{
			this.color = color;
		}
	}
}