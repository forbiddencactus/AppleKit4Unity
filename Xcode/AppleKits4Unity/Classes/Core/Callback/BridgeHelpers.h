//
//  BridgeHelpers.h
//  AppleKits4Unity
//
//  Created by Alex Griffin on 11/3/20.
//  Copyright © 2020 Forbidden Cactus. All rights reserved.
//

//#define str(s) [NSString stringWithUTF8String:s]

@class NSString;

#if __cplusplus
extern "C"
{
#endif
    NSString* str(const char* cstring);
    char* cstr(NSString* str);
#if __cplusplus
}
#endif
