//
//  GameKitBridge.h
//  AppleKits4Unity
//
//  Created by Alex Griffin on 11/3/20.
//  Copyright © 2020 Forbidden Cactus. All rights reserved.
//

#include "CallbackTypes.h"

extern "C"
{
    void gk_authenticate_localplayer(CallbackKey result);
    bool gk_get_is_authenticated();
    char* gk_get_player_displayname();
}
