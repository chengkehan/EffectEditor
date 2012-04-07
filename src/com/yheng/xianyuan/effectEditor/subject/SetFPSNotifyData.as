package com.yheng.xianyuan.effectEditor.subject
{
	import com.codeTooth.actionscript.patterns.subject.NotifyData;
	
	public class SetFPSNotifyData extends NotifyData
	{
		public var fps:int = 0;
		
		public function SetFPSNotifyData(fps:int)
		{
			this.fps = fps;
		}
	}
}