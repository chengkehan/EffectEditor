package com.yheng.xianyuan.effectEditor.view.workspace
{
	import com.codeTooth.actionscript.display.Box;
	import com.codeTooth.actionscript.game.action.Action;
	import com.codeTooth.actionscript.game.action.ActionData;
	import com.codeTooth.actionscript.interaction.drag.ISimpleDragable;
	import com.codeTooth.actionscript.interaction.selection.ISimpleSelectable;
	import com.codeTooth.actionscript.lang.utils.destroy.IDestroy;
	
	import flash.display.Sprite;
	
	public class Effect extends Sprite implements ISimpleDragable, ISimpleSelectable, IDestroy
	{
		private var _action:Action = null;
		
		private var _x:Number = 0;
		
		private var _y:Number = 0;
		
		private var _box:Box = null;
		
		public function Effect(actionData:ActionData)
		{
			_action = new Action(actionData);
			addChild(_action);
			
			_box = new Box(6, 6, 0xFF0000);
			addChild(_box);
		}
		
		public function set boxVisible(bool:Boolean):void
		{
			if(bool)
			{
				addChild(_box);
			}
			else
			{
				if(_box.parent != null)
				{
					_box.parent.removeChild(_box);
				}
			}
		}
		
		public function get boxVisible():Boolean
		{
			return _box.parent != null;
		}
		
		public function get id():Number
		{
			return _action.getActionData().id;
		}

		public function getAction():Action
		{
			return _action;
		}
		
		override public function get x():Number
		{
			return _x;
		}

		override public function set x(value:Number):void
		{
			_box.x = value;
			_x = value;
		}

		override public function get y():Number
		{
			return _y;
		}

		override public function set y(value:Number):void
		{
			_box.y = value;
			_y = value;
		}
		
		public function set xReal(value:Number):void
		{
			super.x = value;
		}
		
		public function get xReal():Number
		{
			return super.x;
		}
		
		public function set yReal(value:Number):void
		{
			super.y = value;
		}
		
		public function get yReal():Number
		{
			return super.y;
		}
		
		public function destroy():void
		{
			if(_action != null)
			{
				_action.destroy();
				_action = null;
			}
		}
	}
}