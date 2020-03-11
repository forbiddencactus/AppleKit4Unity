//
//  BridgeHelpers.m
//  AppleKits4Unity
//
//  Created by Alex Griffin on 11/3/20.
//  Copyright © 2020 Forbidden Cactus. All rights reserved.
//

#import "BridgeHelpers.h"
#import <Foundation/Foundation.h>

extern "C"
{
    NSString* str(const char* cstring)
    {
        if (cstring != NULL)
        {
            return [NSString stringWithUTF8String:cstring];
        }
        
        return [NSString stringWithUTF8String:""];
    }

    char* cstr(NSString* str)
    {
        if (str == nil)
        {
            return NULL;
        }
        
        const char* string = [str UTF8String];
        
        if (string == NULL)
        {
               return NULL;
        }

        char* res = (char*)malloc(strlen(string) + 1);
        strcpy(res, string);

        return res;
    }
}
