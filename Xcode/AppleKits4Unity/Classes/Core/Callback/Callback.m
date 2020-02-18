//
//  Callback.m
//  AppleKits4Unity
//
//  Created by Alex Griffin on 18/2/20.
//  Copyright © 2020 Forbidden Cactus. All rights reserved.
//

#import "Callback.h"

@implementation Callback
{
    RESULT_CALLBACK resultCallback;
    FILERESULT_CALLBACK fileResultCallback;
}

+ (Callback*)sharedInstance
{
    static Callback *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[Callback alloc] init];
    });
    
    return sharedInstance;
}

-(id) init
{
    self = [super init];
    if (self)
    {
        resultCallback = NULL;
    }
    
    return self;
}

-(void) SetResultCallback:(RESULT_CALLBACK)callback
{
    resultCallback = callback;
}

-(RESULT_CALLBACK) GetResultCallback
{
    return resultCallback;
}

-(void) SetFileResultCallback:(FILERESULT_CALLBACK)callback
{
    fileResultCallback = callback;
}

-(FILERESULT_CALLBACK) GetFileResultCallback
{
    return fileResultCallback;
}

@end
