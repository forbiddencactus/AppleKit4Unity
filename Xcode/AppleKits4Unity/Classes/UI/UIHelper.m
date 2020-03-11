//
//  UIHelper.m
//  AppleKits4Unity
//
//  Created by Alex Griffin on 3/3/20.
//  Copyright © 2020 Forbidden Cactus. All rights reserved.
//

#import "UIHelper.h"
#if TARGET_OS_OSX
#import <AppKit/AppKit.h>
#else
#import <UIKit/UIKit.h>
#endif

@implementation UIHelper

+ (UIHelper*)sharedInstance
{
    static UIHelper *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[UIHelper alloc] init];
    });
    
    return sharedInstance;
}

#if TARGET_OS_IOS
- (UIWindow*) getTopApplicationWindow
{
    // grabs the top most window
    NSArray* windows = [[UIApplication sharedApplication] windows];
    return ([windows count] > 0) ? windows[0] : nil;
}

- (UIViewController*) getTopViewController
{
    // get the top most window
    UIWindow *window = [self getTopApplicationWindow];
    
    // get the root view controller for the top most window
    UIViewController *vc = window.rootViewController;
    
    // check if this view controller has any presented view controllers, if so grab the top most one.
    while (vc.presentedViewController != nil)
    {
        // drill to topmost view controller
        vc = vc.presentedViewController;
    }
    
    return vc;
}

-(void) addController:(UIViewController*)controller
{
    // get a reference to the current presented view controller
    UIViewController *parent = [self getTopViewController];
    
    // notify of containment
    [controller willMoveToParentViewController:parent];
    
    // add content as child
    [parent addChildViewController:controller];
    
    // set frame of child content (for demo inset by 100px padding on all sides)
    controller.view.frame = CGRectMake(100.0, 100.0, parent.view.bounds.size.width - 200.0, parent.view.bounds.size.height - 200.0);
    
    // get fancy, lets animate in
    controller.view.alpha = 0.0;
    
    // add as subview
    [parent.view addSubview:controller.view];
    
    // animation duration
    CGFloat duration = 0.3;
    
    // animate the alpha in and bring top views to top
    [UIView animateWithDuration:duration
                     animations:^
     {
         controller.view.alpha = 1.0;
     }
                     completion:nil
     ];
    
}

-(void) removeController:(UIViewController*)controller
{
    // if fade out our view here just because
    [UIView animateWithDuration:0.3
                     animations:^
     {
         controller.view.alpha = 0;
     }
                     completion:^(BOOL finished)
     {
         
         // inform the child it is being removed by passing nil here
         [controller willMoveToParentViewController:nil];
         
         // remove the view
         [controller.view removeFromSuperview];
         
         // remove view controller from container
         [controller removeFromParentViewController];
         
         // nil out tracker
        
    }];
}
#endif

#if TARGET_OS_OSX
- (NSWindow*) getTopApplicationWindow
{
    // grabs the top most window
    NSArray* windows = [[NSApplication sharedApplication] windows];
    return ([windows count] > 0) ? windows[0] : nil;
}

- (NSViewController*) getTopViewController
{
    // get the top most window
    NSWindow *window = [self getTopApplicationWindow];
    
    // get the root view controller for the top most window
    NSViewController *vc = window.contentViewController;
    
    return vc;
}

-(void)addController:(NSViewController*)controller
{
    // get a reference to the current presented view controller
    NSViewController *parent = [self getTopViewController];
    
    [parent presentViewControllerAsSheet:controller];
}

-(void) removeController:(NSViewController*)controller
{
    [controller removeFromParentViewController];
}
#endif

@end
