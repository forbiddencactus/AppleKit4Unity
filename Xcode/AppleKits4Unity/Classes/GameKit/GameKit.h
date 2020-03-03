//
//  GameKit.h
//  AppleKits4Unity
//
//  Created by Alex Griffin on 3/3/20.
//  Copyright © 2020 Forbidden Cactus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CallbackTypes.h"

NS_ASSUME_NONNULL_BEGIN

@interface GameKit : NSObject

+(GameKit*) sharedInstance;

- (void) authenticateLocalPlayer:(CallbackKey) result;
- (bool) isAuthenticated;
- (NSString*) getPlayerDisplayName;

@end

NS_ASSUME_NONNULL_END
