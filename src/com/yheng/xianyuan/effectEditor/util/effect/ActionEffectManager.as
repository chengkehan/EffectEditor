package com.yheng.xianyuan.effectEditor.util.effect
{
	import com.codeTooth.actionscript.game.action.ActionData;
	import com.codeTooth.actionscript.game.action.ActionGroup;
	import com.codeTooth.actionscript.game.action.ClipsDataManager;
	import com.codeTooth.actionscript.lang.utils.destroy.DestroyUtil;
	import com.codeTooth.actionscript.lang.utils.destroy.IDestroy;
	import com.yheng.xianyuan.effectEditor.data.EffectData;
	import com.yheng.xianyuan.effectEditor.data.StageEffectData;
	
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;

	/**
	 * 特效动画管理器
	 */
	public class ActionEffectManager implements IDestroy
	{
		// 所有特效动画
		private var _actionEffects:Dictionary/*key id:Number, value ActionEffect*/ = null;
		
		// 剪辑帧管理器
		private var _clipsDataManager:ClipsDataManager = null;
		
		public function ActionEffectManager()
		{
			_actionEffects = new Dictionary();
			_clipsDataManager = new ClipsDataManager();
		}
		
		/**
		 * 设置一组特效动画
		 * 
		 * @param id
		 * @param bytes
		 * @param completeCallback
		 * 
		 * @return 已经存在指定的返回false
		 */
		public function setEffect(id:Number, bytes:ByteArray, completeCallback:Function):Boolean
		{
			if(containsEffect(id))
			{
				return false;
			}
			else
			{
				_actionEffects[id] = new ActionEffect(id, bytes, completeCallback, _clipsDataManager);
				return true;
			}
		}
		
		/**
		 * 清除一组特效动画
		 * 
		 * @param id
		 * 
		 * @return 不存在指定的返回false
		 */
		public function clearEffect(id:Number):Boolean
		{
			if(containsEffect(id))
			{
				ActionEffect(_actionEffects[id]).destroy();
				delete _actionEffects[id];
				return true;
			}
			else
			{
				return false;
			}
		}
		
		/**
		 * 判断是否包含指定的一组特效动画
		 * 
		 * @param id
		 * 
		 * @return 
		 */
		public function containsEffect(id:Number):Boolean
		{
			return _actionEffects[id] != null;
		}
		
		/**
		 * 获得一个特效动画
		 * 
		 * @param id 特效动画组的id号
		 * @param name 特效动画的名称
		 * 
		 * @return 没有找到返回null
		 */
		public function getAction(id:Number, name:String):ActionGroup
		{
			if(containsEffect(id))
			{
				var actionEffect:ActionEffect = _actionEffects[id];
				var actionsData:Vector.<ActionData> = new Vector.<ActionData>();
				var stageEffectList:Vector.<StageEffectData> = actionEffect.getMergeEffectLoader().getStageEffectList();
				for each(var stageEffect:StageEffectData in stageEffectList)
				{
					if(stageEffect.name == name)
					{
						for each(var effect:EffectData in stageEffect.effects)
						{
							var actionData:ActionData = new ActionData(effect.id, _clipsDataManager.cloneClipsData(effect.templateID), effect.origionX, effect.origionY);
							actionData.addEmptyClipsPrefix(effect.emptyFramesPrefix);
							actionData.addEmptyClipsSuffix(effect.emptyFramesSuffix);
							actionsData.push(actionData);
						}
						
						var actionGroup:ActionGroup = new ActionGroup(actionsData);
						actionGroup.fps = stageEffect.fps;
						
						return actionGroup;
					}
				}
				
				return null;
			}
			else
			{
				return null;
			}
		}
		
		/**
		 * @inheritDoc
		 */
		public function destroy():void
		{
			DestroyUtil.destroyMap(_actionEffects);
			_actionEffects = null;
			DestroyUtil.destroyObject(_clipsDataManager);
			_clipsDataManager = null;
		}
	}
}