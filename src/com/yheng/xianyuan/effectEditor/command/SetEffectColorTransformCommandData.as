package com.yheng.xianyuan.effectEditor.command
{
	public class SetEffectColorTransformCommandData
	{
		public var effectID:Number = 0;
		
		public var r:Number = 0;
		public var g:Number = 0;
		public var b:Number = 0;
		public var a:Number = 0;
		public var ar:Number = 0;
		public var ag:Number = 0;
		public var ab:Number = 0;
		public var aa:Number = 0;
		public var cr:Number = 0;
		public var cg:Number = 0;
		public var cb:Number = 0;
		public var ca:Number = 0;
		public var l:Number = 0;
		
		public function SetEffectColorTransformCommandData(
			effectID:Number, 
			r:Number, g:Number, b:Number, a:Number, 
			ar:Number, ag:Number, ab:Number, aa:Number, 
			cr:Number, cg:Number, cb:Number, ca:Number, l:Number
		)
		{
			this.effectID = effectID;
			this.r = r;
			this.g = g;
			this.b = b;
			this.a = a;
			this.ar = ar;
			this.ag = ag;
			this.ab = ab;
			this.aa = aa;
			this.cr = cr;
			this.cg = cg;
			this.cb = cb;
			this.ca = ca;
			this.l = l;
		}
	}
}