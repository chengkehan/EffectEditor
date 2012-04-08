package com.yheng.xianyuan.effectEditor.command
{
	
	public class MergeEffectsAndImagesCommand extends MergeBaseCommand
	{
		public function MergeEffectsAndImagesCommand()
		{
			super("mergeImageFile", "选择需要合并的数据图片", "选择保存合并的数据图片的位置", "合并数据图片时发生异常", "保存合并数据图片时发生异常");
		}
	}
}