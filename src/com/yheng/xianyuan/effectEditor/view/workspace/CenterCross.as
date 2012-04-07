package com.yheng.xianyuan.effectEditor.view.workspace
{
	import com.codeTooth.actionscript.display.GraphicsPen;
	
	import flash.display.Shape;
	
	public class CenterCross extends Shape
	{
		public function CenterCross()
		{
			graphics.beginFill(0xFFFFFF);
			GraphicsPen.drawCross(graphics, 10, 2);
			graphics.endFill();
		}
	}
}