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
void ck_save_file_with_key(const char* key, const char* filePath, CallbackKey result);
void ck_fetch_file_with_key(const char* key, CallbackKey fileResult);
void ck_save_string_with_key(const char* key, const char* string, CallbackKey result);
void ck_fetch_string_with_key(const char* key, CallbackKey stringResult);
void ck_check_account_status(CallbackKey result);
}
