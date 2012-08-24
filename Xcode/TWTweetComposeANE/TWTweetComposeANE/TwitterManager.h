//
//  TwitterManager.h
//  TwitterXcode
//
//  Created by Suzuki Kuniaki on 2012/08/23.
//  Copyright (c) 2012年 Suzuki Kuniaki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Twitter/Twitter.h>
@interface TwitterManager : NSObject
{
    
    TWTweetComposeViewController *tweetView;
    
}

@property (nonatomic, assign) UIViewController *targetView;


+ (BOOL)canSendTweet;
- (void)openWithAnimated:(BOOL)animated;
- (BOOL)makeTweetViewWithText:(NSString *)text;
- (BOOL)addImage:(UIImage *)image;
- (BOOL)removeAllImages;
- (BOOL)addURL:(NSString *)url;



@end
