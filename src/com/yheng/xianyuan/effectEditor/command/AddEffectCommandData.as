package com.yheng.xianyuan.effectEditor.command
{
	public class AddEffectCommandData
	{
		public var effectTemplateID:Number = 0;
		
		public var effectID:Number = 0;
		
		public var origionX:int = 0;
		
		public var origionY:int = 0;
		
		public var prefix:int = 0;
		
		public var suffix:int = 0;
		
		public var a:Number = 1;
		public var r:Number = 1;
		public var g:Number = 1;
		public var b:Number = 1;
		
		public var aa:Number = 0;
		public var ar:Number = 0;
		public var ag:Number = 0;
		public var ab:Number = 0;
		
		public var cr:Number = 0;
		public var cg:Number = 0;
		public var cb:Number = 0;
		public var ca:Number = 100;
		
		public var l:Number = 0;
		
		public var v1:Number = 0;
		public var v2:Number = 0;
		public var v3:Number = 0;
		public var v4:Number = 0;
		
		public function AddEffectCommandData(
			effectTemplateID:Number, effectID:Number, origionX:int, origionY:int, prefix:int, suffix:int = 0, 
			a:Number = 1, r:Number = 1, g:Number = 1, b:Number = 1, 
			aa:Number = 0, ar:Number = 0, ag:Number = 0, ab:Number = 0, 
			ca:Number = 100, cr:Number = 0, cg:Number = 0, cb:Number = 0, l:Number = 0, 
			v1:Number = 0, v2:Number = 0, v3:Number = 0, v4:Number = 0
		)
		{
			this.effectTemplateID = effectTemplateID;
			this.effectID = effectID;
			this.origionX = origionX;
			this.origionY = origionY;
			this.prefix = prefix;
			this.suffix = suffix;
			this.a = a;
			this.r = r;
			this.g = g;
			this.aa = aa;
			this.ar = ar;
			this.ag = ag;
			this.ab = ab;
			this.ca = ca;
			this.cr = cr;
			this.cg = cg;
			this.cb = cb;
			this.l = l;
			this.v1 = v1;
			this.v2 = v2;
			this.v3 = v3;
			this.v4 = v4;
		}
	}
}