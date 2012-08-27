ANE-TWTweetCompose
==================

Using TWTweetComposeViewController(but , simple tweet method only) for Air Native Extension in iOS.


Screenshots
-----------
![Screenshot0](http://kuniakisuzuki.cocolog-nifty.com/photos/uncategorized/2012/08/25/img_2272.png)


Usage.
-------------
    import jp.sikisize.TWTweetComposeExtension;

    var _ane:TWTweetComposeExtension = new TWTweetComposeExtension();

    if(_ane.canSendTweet()){

        //_ane.setTweetViewWithText("test!");
    
        _ane.setTweetViewWithTextAndURL("test!" , "http://www.google.com");

    }
    
Coming soon
===========
Support Adobe AIR for iOS6 , add Facebook post function.