package com.yheng.xianyuan.effectEditor.util.effect
{
	import com.codeTooth.actionscript.game.action.ActionData;
	import com.codeTooth.actionscript.game.action.ActionGroup;
	import com.codeTooth.actionscript.game.action.Actions;
	import com.codeTooth.actionscript.game.action.ClipsDataManager;
	import com.codeTooth.actionscript.lang.utils.destroy.DestroyUtil;
	import com.codeTooth.actionscript.lang.utils.destroy.IDestroy;
	import com.yheng.xianyuan.effectEditor.data.EffectData;
	import com.yheng.xianyuan.effectEditor.data.StageEffectData;
	
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;

	public class ActionEffectManager implements IDestroy
	{
		private var _actionEffects:Dictionary/*key id:Number, value ActionEffect*/ = null;
		
		private var _clipsDataManager:ClipsDataManager = null;
		
		public function ActionEffectManager()
		{
			_actionEffects = new Dictionary();
			_clipsDataManager = new ClipsDataManager();
		}
		
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
		
		public function containsEffect(id:Number):Boolean
		{
			return _actionEffects[id] != null;
		}
		
		public function getAction(id:Number, name:String):ActionGroup
		{
			if(containsEffect(id))
			{
				var actionEffect:ActionEffect = _actionEffects[id];
				var actionsData:Vector.<ActionData> = new Vector.<ActionData>();
				for each(var stageEffect:StageEffectData in actionEffect.getMergeEffect().getStageEffectList())
				{
					if(stageEffect.name == name)
					{
						for each(var effect:EffectData in stageEffect.effects)
						{
							var actionData:ActionData = new ActionData(effect.id, _clipsDataManager.cloneClipsData(effect.templateID), effect.origionX, effect.origionY);
							var emptyFrameIndex:int = 0;
							for (emptyFrameIndex = 0; emptyFrameIndex < effect.emptyFramesPrefix; emptyFrameIndex++) 
							{
								actionData.addEmptyClipPrefix();
							}
							for (emptyFrameIndex = 0; emptyFrameIndex < effect.emptyFramesSuffix; emptyFrameIndex++) 
							{
								actionData.addEmptyClipSuffix();
							}
							
							actionsData.push(actionData);
						}
						return new ActionGroup(actionsData);
					}
				}
				
				return null;
			}
			else
			{
				return null;
			}
		}
		
		public function destroy():void
		{
			DestroyUtil.destroyMap(_actionEffects);
			_actionEffects = null;
			DestroyUtil.destroyObject(_clipsDataManager);
			_clipsDataManager = null;
		}
	}
}