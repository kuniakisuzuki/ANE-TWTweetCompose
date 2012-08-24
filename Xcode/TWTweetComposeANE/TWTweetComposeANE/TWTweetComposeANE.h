//
//  TWTweetComposeANE.h
//  TWTweetComposeANE
//
//  Created by Suzuki Kuniaki on 2012/08/24.
//  Copyright (c) 2012年 Suzuki Kuniaki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FlashRuntimeExtensions.h"

@interface TWTweetComposeANE : NSObject

@end

FREObject canSendTweet(
                       FREContext ctx,
                       void* funcData,
                       uint32_t argc,
                       FREObject arg[]
                       );
FREObject setTweetViewWithText(
                               FREContext ctx,
                               void* funcData,
                               uint32_t argc,
                               FREObject arg[]
                               );
FREObject setTweetViewWithTextAndURL(
                                     FREContext ctx,
                                     void* funcData,
                                     uint32_t argc,
                                     FREObject arg[]
                                     );

void ContextInitializer(
                        void* extData,
                        const uint8_t* ctxType,
                        FREContext ctx,
                        uint32_t* numFunctionsToTest,
                        const FRENamedFunction** functionsToSet
                        );

void ContextFinalizer(FREContext ctx);

void ExtInitializer(
                    void** extDataToSet,
                    FREContextInitializer* ctxInitializerToSet,
                    FREContextFinalizer* ctxFinalizerToSet
                    );
void ExtFinalizer(void* extData);