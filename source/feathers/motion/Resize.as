/*
Feathers
Copyright 2012-2018 Bowler Hat LLC. All Rights Reserved.

This program is free software. You can redistribute and/or modify it in
accordance with the terms of the accompanying license agreement.
*/
package feathers.motion
{
	import feathers.core.IFeathersControl;

	import starling.animation.Transitions;
	import starling.animation.Tween;
	import starling.display.DisplayObject;
	import feathers.motion.effectClasses.IResizeEffectContext;
	import feathers.motion.effectClasses.TweenResizeEffectContext;
	import feathers.motion.effectClasses.IEffectContext;
	import feathers.motion.effectClasses.TweenEffectContext;

	/**
	 * Animates a component's <code>width</code> and <code>height</code> dimensions. 
	 *
	 * @productversion Feathers 3.5.0
	 */
	public class Resize
	{
		/**
		 * Creates an effect function for the target component that animates
		 * its dimensions when they are changed. Must be used with the
		 * <code>resizeEffect</code> property.
		 * 
		 * @see feathers.core.FeathersControl#resizeEffect
		 *
		 * @productversion Feathers 3.5.0
		 */
		public static function createResizeEffect(duration:Number = 0.5, ease:Object = Transitions.EASE_OUT):Function
		{
			return function(target:DisplayObject):IResizeEffectContext
			{
				var tween:Tween = new Tween(target, duration, ease);
				return new TweenResizeEffectContext(tween);
			}
		}

		/**
		 * Creates an effect function for the target component that
		 * animates its dimensions from their current values to new values.
		 *
		 * @productversion Feathers 3.5.0
		 * 
		 * @see #createResizeWidthToEffect()
		 * @see #createResizeHeightToEffect()
		 */
		public static function createResizeToEffect(toWidth:Number, toHeight:Number, duration:Number = 0.5, ease:Object = Transitions.EASE_OUT):Function
		{
			return function(target:DisplayObject):IEffectContext
			{
				var tween:Tween = new Tween(target, duration, ease);
				tween.animate("width", toWidth);
				tween.animate("height", toHeight);
				return new TweenEffectContext(tween);
			}
		}

		/**
		 * Creates an effect function for the target component that
		 * animates its <strong>width</strong> from its current value to a new
		 * value.
		 *
		 * @productversion Feathers 3.5.0
		 */
		public static function createResizeWidthToEffect(toWidth:Number, duration:Number = 0.5, ease:Object = Transitions.EASE_OUT):Function
		{
			return function(target:DisplayObject):IEffectContext
			{
				var tween:Tween = new Tween(target, duration, ease);
				tween.animate("width", toWidth);
				return new TweenEffectContext(tween);
			}
		}

		/**
		 * Creates an effect function for the target component that
		 * animates its <strong>height</strong> from its current value to a new
		 * value.
		 *
		 * @productversion Feathers 3.5.0
		 */
		public static function createResizeHeightToEffect(toHeight:Number, duration:Number = 0.5, ease:Object = Transitions.EASE_OUT):Function
		{
			return function(target:DisplayObject):IEffectContext
			{
				var tween:Tween = new Tween(target, duration, ease);
				tween.animate("height", toHeight);
				return new TweenEffectContext(tween);
			}
		}

		/**
		 * Creates an effect function for the target component that
		 * animates its dimensions from specific values to its
		 * current values.
		 *
		 * @productversion Feathers 3.5.0
		 * 
		 * @see #createResizeWidthFromEffect()
		 * @see createResizeHeightFromEffect()
		 */
		public static function createResizeFromEffect(fromWidth:Number, fromHeight:Number, duration:Number = 0.5, ease:Object = Transitions.EASE_OUT):Function
		{
			return function(target:DisplayObject):IEffectContext
			{
				var oldWidth:Number = target.width;
				var oldHeight:Number = target.height;
				if(target is IFeathersControl)
				{
					IFeathersControl(target).suspendEffects();
				}
				target.width = fromWidth;
				target.height = fromHeight;
				if(target is IFeathersControl)
				{
					IFeathersControl(target).resumeEffects();
				}
				var tween:Tween = new Tween(target, duration, ease);
				tween.animate("width", oldWidth);
				tween.animate("height", oldHeight);
				return new TweenEffectContext(tween);
			}
		}

		/**
		 * Creates an effect function for the target component that
		 * animates its <strong>width</strong> from a specific value to its
		 * current value.
		 *
		 * @productversion Feathers 3.5.0
		 */
		public static function createResizeWidthFromEffect(fromWidth:Number, duration:Number = 0.5, ease:Object = Transitions.EASE_OUT):Function
		{
			return function(target:DisplayObject):IEffectContext
			{
				var oldWidth:Number = target.width;
				if(target is IFeathersControl)
				{
					IFeathersControl(target).suspendEffects();
				}
				target.width = fromWidth;
				if(target is IFeathersControl)
				{
					IFeathersControl(target).resumeEffects();
				}
				var tween:Tween = new Tween(target, duration, ease);
				tween.animate("width", oldWidth);
				return new TweenEffectContext(tween);
			}
		}

		/**
		 * Creates an effect function for the target component that
		 * animates its <strong>height</strong> from a specific value to its
		 * current value.
		 *
		 * @productversion Feathers 3.5.0
		 */
		public static function createResizeHeightFromEffect(fromHeight:Number, duration:Number = 0.5, ease:Object = Transitions.EASE_OUT):Function
		{
			return function(target:DisplayObject):IEffectContext
			{
				var oldHeight:Number = target.height;
				if(target is IFeathersControl)
				{
					IFeathersControl(target).suspendEffects();
				}
				target.height = fromHeight;
				if(target is IFeathersControl)
				{
					IFeathersControl(target).resumeEffects();
				}
				var tween:Tween = new Tween(target, duration, ease);
				tween.animate("height", oldHeight);
				return new TweenEffectContext(tween);
			}
		}

		/**
		 * Creates an effect function for the target component that
		 * animates its dimensions from its current values to new values
		 * calculated by an offset.
		 *
		 * @productversion Feathers 3.5.0
		 * 
		 * @see #createResizeWidthByEffect()
		 * @see #createResizeHeightByEffect()
		 */
		public static function createResizeByEffect(widthBy:Number, heightBy:Number, duration:Number = 0.5, ease:Object = Transitions.EASE_OUT):Function
		{
			return function(target:DisplayObject):IEffectContext
			{
				var tween:Tween = new Tween(target, duration, ease);
				tween.animate("width", target.width + widthBy);
				tween.animate("height", target.height + heightBy);
				return new TweenEffectContext(tween);
			}
		}

		/**
		 * Creates an effect function for the target component that
		 * animates its <strong>width</strong> from its current value to a new
		 * value calculated by an offset.
		 *
		 * @productversion Feathers 3.5.0
		 */
		public static function createResizeWidthByEffect(widthBy:Number, duration:Number = 0.5, ease:Object = Transitions.EASE_OUT):Function
		{
			return function(target:DisplayObject):IEffectContext
			{
				var tween:Tween = new Tween(target, duration, ease);
				tween.animate("width", target.width + widthBy);
				return new TweenEffectContext(tween);
			}
		}

		/**
		 * Creates an effect function for the target component that
		 * animates its <strong>height</strong> from its current value to a new
		 * value calculated by an offset.
		 *
		 * @productversion Feathers 3.5.0
		 */
		public static function createResizeHeightByEffect(heightBy:Number, duration:Number = 0.5, ease:Object = Transitions.EASE_OUT):Function
		{
			return function(target:DisplayObject):IEffectContext
			{
				var tween:Tween = new Tween(target, duration, ease);
				tween.animate("height", target.height + heightBy);
				return new TweenEffectContext(tween);
			}
		}
	}
}