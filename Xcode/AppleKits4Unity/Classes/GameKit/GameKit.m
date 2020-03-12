//
//  GameKit.m
//  AppleKits4Unity
//
//  Created by Alex Griffin on 3/3/20.
//  Copyright © 2020 Forbidden Cactus. All rights reserved.
//

#import "GameKit.h"
#import "UIHelper.h"
#import "Callback.h"
#import "BridgeHelpers.h"
#import <GameKit/GameKit.h>
#if TARGET_OS_OSX
#import <AppKit/AppKit.h>
#else
#import <UIKit/UIKit.h>
#endif

@implementation GameKit
{
    GKLocalPlayer* localPlayer;
}

+ (GameKit*)sharedInstance
{
    static GameKit *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[GameKit alloc] init];
    });
    
    return sharedInstance;
}

-(id) init
{
    self = [super init];
    if (self)
    {
        localPlayer = nil;
    }
    
    return self;
}

-(GKLocalPlayer*) getLocalPlayerSafe
{
    if (localPlayer != nil)
    {
        if (localPlayer.isAuthenticated)
        {
            return localPlayer;
        }
    }
    
    return nil;
}

- (bool) isAuthenticated
{
    return [[GKLocalPlayer localPlayer] isAuthenticated];
}

- (void) authenticateLocalPlayer:(CallbackKey) result
{
    [[Callback sharedInstance] Log:@"GameKitManager Native: Authenticating player!"];
    GKLocalPlayer *localPlayer = [GKLocalPlayer localPlayer];
    
    #if TARGET_OS_OSX
    localPlayer.authenticateHandler = ^(NSViewController* viewController, NSError *error){
            if (viewController != nil)
            {
                [[UIHelper sharedInstance] addController: viewController];
            }
            else if (localPlayer.isAuthenticated)
            {
                //authenticatedPlayer: is an example method name. Create your own method that is called after the local player is authenticated.
                [[Callback sharedInstance] GetResultCallback](result, true, NULL);
            }
            else
            {
                [[Callback sharedInstance] GetResultCallback](result, false, cstr([[NSNumber numberWithInt:(int)error.code] stringValue]));
            }
        };
    #else
     localPlayer.authenticateHandler = ^(UIViewController* viewController, NSError *error){
            if (viewController != nil)
            {
                //showAuthenticationDialogWhenReasonable: is an example method name. Create your own method that displays an authentication view when appropriate for your app.
                //[[UIHelper sharedInstance] addController: viewController];
                [[Callback sharedInstance] GetResultCallback](result, false, cstr([[NSNumber numberWithInt:(int)error.code] stringValue]));
            }
            else if (localPlayer.isAuthenticated)
            {
                //authenticatedPlayer: is an example method name. Create your own method that is called after the local player is authenticated.
                [[Callback sharedInstance] GetResultCallback](result, true, NULL);
            }
            else
            {
                [[Callback sharedInstance] GetResultCallback](result, false, cstr([[NSNumber numberWithInt:(int)error.code] stringValue]));
            }
        };
    #endif
}

- (NSString*) getPlayerDisplayName
{
    return [[self getLocalPlayerSafe] displayName];
}

- (NSString*) getPlayerID
{
    return [[self getLocalPlayerSafe] playerID];
}

@end
