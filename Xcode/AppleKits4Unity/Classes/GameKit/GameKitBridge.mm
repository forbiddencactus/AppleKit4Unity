//
//  GameKitBridge.m
//  AppleKits4Unity
//
//  Created by Alex Griffin on 11/3/20.
//  Copyright © 2020 Forbidden Cactus. All rights reserved.
//

#import "GameKitBridge.h"
#import "GameKit.h"
#import "BridgeHelpers.h"

extern "C"
{
    void gk_authenticate_localplayer(CallbackKey result)
    {
        [[GameKit sharedInstance] authenticateLocalPlayer:result];
    }
    bool gk_get_is_authenticated()
    {
        return [[GameKit sharedInstance] isAuthenticated];
    }
    char* gk_get_player_displayname()
    {
        return cstr([[GameKit sharedInstance] getPlayerDisplayName]);
    }
}
