package com.yheng.xianyuan.effectEditor.subject
{
	import com.codeTooth.actionscript.patterns.subject.NotifyData;
	
	public class SetPlayingNotifyData extends NotifyData
	{
		public var playing:Boolean = false;
		
		public function SetPlayingNotifyData(playing:Boolean)
		{
			this.playing = playing;
		}
	}
}