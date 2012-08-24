//
//  TWTweetComposeANE.m
//  TWTweetComposeANE
//
//  Created by Suzuki Kuniaki on 2012/08/24.
//  Copyright (c) 2012年 Suzuki Kuniaki. All rights reserved.
//

#import "TWTweetComposeANE.h"
#import "TwitterManager.h"
@implementation TWTweetComposeANE

@end

#define MAP_FUNCTION(fn, data) { (const uint8_t*)(#fn), (data), &(fn) }

FREObject canSendTweet(
                       FREContext ctx,
                       void* funcData,
                       uint32_t argc,
                       FREObject arg[]
                       )
{
    uint32_t retValue = ([TwitterManager canSendTweet]) ? 1 : 0;
    
    FREObject result;
    if ( FRENewObjectFromBool(retValue, &result ) == FRE_OK )
    {
        return result;
    }
    return NULL;
}


TwitterManager* makeManager()
{
    
    TwitterManager *manager = [[[TwitterManager alloc]init] autorelease];
    
    UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
    UIViewController *mainController = [keyWindow rootViewController];
    
    manager.targetView = mainController;
    
    return manager;
}

NSString* cStringToNSstring(FREObject arg)
{
    uint32_t length;
    const uint8_t *str;
    FREGetObjectAsUTF8(arg, &length, &str);
    NSString *returnString = [NSString stringWithUTF8String:(char*)str];
    
    return returnString;
}


FREObject setTweetViewWithText(
                               FREContext ctx,
                               void* funcData,
                               uint32_t argc,
                               FREObject arg[]
                               )
{
    TwitterManager *manager = makeManager();
    
    NSString *tweetStr = cStringToNSstring(arg[0]);
    
    [manager makeTweetViewWithText:tweetStr];
    [manager openWithAnimated:YES];
    
    return NULL;
}

FREObject setTweetViewWithTextAndURL(
                                     FREContext ctx,
                                     void* funcData,
                                     uint32_t argc,
                                     FREObject arg[]
                                     )
{
    
    TwitterManager *manager = makeManager();
    
    NSString *tweetStr = cStringToNSstring(arg[0]);
    NSString *urlStr = cStringToNSstring(arg[1]);
    
    [manager makeTweetViewWithText:tweetStr];
    [manager addURL:urlStr];
    [manager openWithAnimated:YES];
    
    return NULL;
}

void ContextInitializer( void* extData, const uint8_t* ctxType, FREContext ctx, uint32_t* numFunctionsToSet, const FRENamedFunction** functionsToSet )
{
    static FRENamedFunction functionMap[] = {
        MAP_FUNCTION( canSendTweet, NULL ),
        MAP_FUNCTION( setTweetViewWithText, NULL ),
        MAP_FUNCTION( setTweetViewWithTextAndURL, NULL ),
    };
    
	*numFunctionsToSet = sizeof( functionMap ) / sizeof( FRENamedFunction );
	*functionsToSet = functionMap;
}


void ContextFinalizer(FREContext ctx) {
    return;
}

void ExtInitializer(void** extDataToSet, FREContextInitializer* ctxInitializerToSet,
                    FREContextFinalizer* ctxFinalizerToSet) {
    *extDataToSet = NULL;
    *ctxInitializerToSet = &ContextInitializer;
    *ctxFinalizerToSet = &ContextFinalizer;
}
void ExtFinalizer(void* extData) {
    return;
}