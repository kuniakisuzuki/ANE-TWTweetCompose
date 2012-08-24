//
//  TwitterManager.m
//  TwitterXcode
//
//  Created by Suzuki Kuniaki on 2012/08/23.
//  Copyright (c) 2012年 Suzuki Kuniaki. All rights reserved.
//

#import "TwitterManager.h"

@implementation TwitterManager



+(BOOL)canSendTweet
{
    return [TWTweetComposeViewController canSendTweet];
}

-(void)openWithAnimated:(BOOL)animated
{
    if(_targetView){
        [_targetView presentModalViewController:tweetView animated:animated];
        [tweetView release];
    }
}

-(BOOL)makeTweetViewWithText:(NSString *)text
{
    if(tweetView)
        [tweetView release],tweetView = nil;
    
    tweetView = [[TWTweetComposeViewController alloc] init];
    return [tweetView setInitialText:text];
}

-(BOOL)addImage:(UIImage *)image
{
    return [tweetView addImage:image];
}

-(BOOL)removeAllImages
{
    return [tweetView removeAllImages];
}

-(BOOL)addURL:(NSString *)url
{
    return [tweetView addURL:[NSURL URLWithString:url]];
}

-(BOOL)removeAllURLs
{
    return [tweetView removeAllURLs];
}

-(void)dealloc
{
    if(tweetView)
        [tweetView release],tweetView = nil;
    
    [_targetView release];
    [super dealloc];
}


@end
