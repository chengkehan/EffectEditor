package
{
	import com.codeTooth.actionscript.game.action.ActionGroup;
	import com.codeTooth.actionscript.game.action.ActionPlayer;
	import com.codeTooth.actionscript.game.action.IAction;
	import com.yheng.xianyuan.effectEditor.util.effect.ActionEffectManager;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.utils.ByteArray;
	import flash.utils.getTimer;
	
	[SWF(frameRate="30", width="1000", height="700", backgroundColor="0x000000")]
	public class ActionEffectTest extends Sprite
	{
		// 编辑器导出的舞台特效二进制数据
		// 也可以是编辑器将多个舞台特效合并后的二进制数据
		[Embed(source="stage12", mimeType="application/octet-stream")]
		private var StageEffectMerge1:Class;
		
		// 管理器
		private var _actionEffectManager:ActionEffectManager = null;
		
		// 播放器
		private var _player:ActionPlayer = null;
		
		public function ActionEffectTest()
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			var stageEffectMerge1:ByteArray = new StageEffectMerge1();
			
			_player = new ActionPlayer();
			
			_actionEffectManager = new ActionEffectManager();
			// 添加舞台特效
			_actionEffectManager.addEffect(1, stageEffectMerge1, completeCallback);
		}
		
		private function completeCallback():void
		{
			for (var i:int = 0; i < 200; i++) 
			{
//				var action:IAction = _actionEffectManager.getAction(1, "fenshiguiyan_green");
				// 获得一个舞台特效
				var action:IAction = _actionEffectManager.getAction(1, "fenshiguiyan");
				addChild(DisplayObject(action));
				action.x = stage.stageWidth * Math.random();
				action.y = stage.stageHeight * Math.random();
//				action.x = stage.stageWidth * .5;
//				action.y = stage.stageHeight * .5;
				
				// 加入播放器
				_player.addAction(action);
			}
			
			addEventListener(Event.ENTER_FRAME, loopHandler);
		}
		
		private var _time:int = 0;
		private function loopHandler(event:Event):void
		{
			if(_time == 0)
			{
				_time = getTimer();
			}
			else
			{
				var time:int = getTimer();
				// 播放
				_player.loop(_time, time);
				_time = time;
			}
		}
	}
}