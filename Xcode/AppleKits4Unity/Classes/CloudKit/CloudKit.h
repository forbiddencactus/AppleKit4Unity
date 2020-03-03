//
//  CloudKit.h
//  AppleKits4Unity
//
//  Created by Alex Griffin on 18/2/20.
//  Copyright © 2020 Forbidden Cactus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CallbackTypes.h"

NS_ASSUME_NONNULL_BEGIN

@interface CloudKit : NSObject

+ (CloudKit*)sharedInstance;
-(void) SaveFileWithKey:(NSString*)key filePath:(NSString*) filePath resultHandler:(CallbackKey) result;
-(void) FetchFileWithKey:(NSString*) key fileResultHandler:(CallbackKey) fileResult;
-(void) SaveStringWithKey:(NSString*) key string:(NSString*) string resultHandler:(CallbackKey) result;
-(void) FetchStringWithKey:(NSString*) key stringResultHandler:(CallbackKey) stringResult;
-(void) CheckAccountStatus:(CallbackKey) result;

@end

NS_ASSUME_NONNULL_END
