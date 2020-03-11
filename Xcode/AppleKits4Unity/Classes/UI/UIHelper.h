//
//  UIHelper.h
//  AppleKits4Unity
//
//  Created by Alex Griffin on 3/3/20.
//  Copyright © 2020 Forbidden Cactus. All rights reserved.
//

#import <Foundation/Foundation.h>

#if TARGET_OS_OSX
@class NSWindow, NSViewController;
#endif

#if TARGET_OS_IOS
@class UIWindow, UIViewController;
#endif

NS_ASSUME_NONNULL_BEGIN

@interface UIHelper : NSObject

+(UIHelper*)sharedInstance;

#if TARGET_OS_IOS
- (UIWindow*) getTopApplicationWindow;

- (UIViewController*) getTopViewController;

-(void) addController:(UIViewController*)controller;

-(void) removeController: (UIViewController*) controller;
#endif

#if TARGET_OS_OSX
- (NSWindow*) getTopApplicationWindow;

- (NSViewController*) getTopViewController;

-(void) addController: (NSViewController*)controller;

-(void) removeController:(NSViewController*)controller;
#endif

@end

NS_ASSUME_NONNULL_END
