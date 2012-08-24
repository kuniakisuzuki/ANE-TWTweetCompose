ANE-TWTweetCompose
==================

Using TWTweetComposeViewController(but , simple tweet method only) for Air Native Extension in iOS.

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
Support Adobe AIR for iOS6 , Support Facebook post.