package com.yheng.xianyuan.effectEditor.command
{
	import flash.utils.ByteArray;
	
	public class MergeEffectsCommand extends MergeBaseCommand
	{
		private var _outputBuffer:ByteArray = null;
		
		public function MergeEffectsCommand()
		{
			super("mergeEffectsFile", "选择需要合并的数据", "选择保存合并的数据的位置", "合并数据时发生异常", "保存合并数据时发生异常");
		}
	}
}