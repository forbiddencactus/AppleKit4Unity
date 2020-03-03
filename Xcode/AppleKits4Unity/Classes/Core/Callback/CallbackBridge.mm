//
//  CallbackBridge.m
//  AppleKits4Unity
//
//  Created by Alex Griffin on 20/2/20.
//  Copyright © 2020 Forbidden Cactus. All rights reserved.
//

#import "CallbackBridge.h"
#import "Callback.h"

extern "C"
{
    
void set_resultcallback(RESULT_CALLBACK callback)
{
    [[Callback sharedInstance] SetResultCallback:callback];
}
void set_fileresultcallback(FILERESULT_CALLBACK callback)
{
    [[Callback sharedInstance] SetFileResultCallback:callback];
}

void set_stringresultcallback(STRINGRESULT_CALLBACK callback)
{
    [[Callback sharedInstance] SetStringResultCallback:callback];
}
    
void set_logcallback(UNITY_LOG callback)
{
    [[Callback sharedInstance] SetLog:callback];
}
    
}
