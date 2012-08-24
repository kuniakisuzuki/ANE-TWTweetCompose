package jp.sikisize
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.external.ExtensionContext; //追加
	
	
	public class TWTweetComposeExtension extends EventDispatcher
	{
		private var context:ExtensionContext; //追加
		public function TWTweetComposeExtension(target:IEventDispatcher=null)
		{
			super(target);
			context= ExtensionContext.createExtensionContext("sikisize.ane.TWTweetCompose", "type"); //追加
		}
		
		//追加 /////
		public function canSendTweet():Boolean
		{
			return context.call("canSendTweet") as Boolean;
		}
		
		//追加 /////
		public function setTweetViewWithText(text:String):void
		{
			context.call("setTweetViewWithText" , text);
		}
		
		//追加 /////
		public function setTweetViewWithTextAndURL(text:String , url:String):void
		{
			context.call("setTweetViewWithTextAndURL" , text , url);
		}
		
		public function dispose():void
		{
			return context.dispose();
		}
		
	}
}