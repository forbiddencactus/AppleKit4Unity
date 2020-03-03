//
//  Callback.h
//  AppleKits4Unity
//
//  Created by Alex Griffin on 18/2/20.
//  Copyright © 2020 Forbidden Cactus. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "CallbackTypes.h"

NS_ASSUME_NONNULL_BEGIN

@interface Callback : NSObject

+(Callback*) sharedInstance;

-(void) SetLog:(UNITY_LOG) callBack;
-(void) Log:(const char*) logMessage;

-(void) SetResultCallback:(RESULT_CALLBACK) callback;
-(RESULT_CALLBACK) GetResultCallback;

-(void) SetFileResultCallback:(FILERESULT_CALLBACK) callback;
-(FILERESULT_CALLBACK) GetFileResultCallback;

@end

NS_ASSUME_NONNULL_END
