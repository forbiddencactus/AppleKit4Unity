//
//  CloudKitBridge.m
//  AppleKits4Unity
//
//  Created by Alex Griffin on 20/2/20.
//  Copyright © 2020 Forbidden Cactus. All rights reserved.
//

#import "CloudKit.h"
#import "CloudKitBridge.h"
#import "BridgeHelpers.h"

extern "C"
{
    void ck_save_file_with_key(const char* key, const char* filePath, CallbackKey result)
    {
        [[CloudKit sharedInstance] SaveFileWithKey:str(key) filePath:str(filePath)  resultHandler:result];
    }

    void ck_fetch_file_with_key(const char* key, CallbackKey fileResult)
    {
        [[CloudKit sharedInstance] FetchFileWithKey: str(key) fileResultHandler:fileResult];
    }

    void ck_check_account_status(CallbackKey result)
    {
        [[CloudKit sharedInstance] CheckAccountStatus:result];
    }

    void ck_save_string_with_key(const char* key, const char* string, CallbackKey result)
    {
        [[CloudKit sharedInstance] SaveStringWithKey:str(key) string:str(string) resultHandler:result];
    }

    void ck_fetch_string_with_key(const char* key, CallbackKey stringResult)
    {
        [[CloudKit sharedInstance] FetchStringWithKey:str(key) stringResultHandler:stringResult];
    }
}

