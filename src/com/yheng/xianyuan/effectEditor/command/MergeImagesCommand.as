package com.yheng.xianyuan.effectEditor.command
{
	
	public class MergeImagesCommand extends MergeBaseCommand
	{
		public function MergeImagesCommand()
		{
			super("mergeImageFile", "选择需要合并的图片", "选择保存合并的图片的位置", "合并图片时发生异常", "保存合并图片时发生异常");
		}
	}
}