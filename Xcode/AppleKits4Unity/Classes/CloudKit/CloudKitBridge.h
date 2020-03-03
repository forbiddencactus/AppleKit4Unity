//
//  CloudKitBridge.h
//  AppleKits4Unity
//
//  Created by Alex Griffin on 20/2/20.
//  Copyright © 2020 Forbidden Cactus. All rights reserved.
//
#include "CallbackTypes.h"

extern "C"
{
void save_file_with_key(char* key, char* filePath, CallbackKey result);
void fetch_file_with_key(char* key, CallbackKey fileResult);
void check_account_status(CallbackKey result);
}
