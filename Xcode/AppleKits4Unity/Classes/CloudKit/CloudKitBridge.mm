//
//  CloudKitBridge.m
//  AppleKits4Unity
//
//  Created by Alex Griffin on 20/2/20.
//  Copyright © 2020 Forbidden Cactus. All rights reserved.
//

#import "CloudKit.h"
#import "CloudKitBridge.h"

extern "C"
{
    
    void save_file_with_key(char* key, char* filePath, CallbackKey result)
    {
        [[CloudKit sharedInstance] SaveFileWithKey:[NSString stringWithCString:key encoding:kCFStringEncodingUTF8] filePath:[NSString stringWithCString:filePath encoding:kCFStringEncodingUTF8]  resultHandler:result];
    }

    void fetch_file_with_key(char* key, CallbackKey fileResult)
    {
        [[CloudKit sharedInstance] FetchFileWithKey: [NSString stringWithCString:key encoding:kCFStringEncodingUTF8] fileResultHandler:fileResult];
    }

    void check_account_status(CallbackKey result)
    {
        [[CloudKit sharedInstance] CheckAccountStatus:result];
    }
}

