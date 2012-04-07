package com.yheng.xianyuan.effectEditor.subject
{
	import com.codeTooth.actionscript.patterns.subject.NotifyData;
	
	public class SetNameNotifyData extends NotifyData
	{
		public var name:String = null;
		
		public function SetNameNotifyData(name:String)
		{
			this.name = name;
		}
	}
}