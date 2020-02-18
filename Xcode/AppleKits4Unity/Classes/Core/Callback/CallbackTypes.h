//
//  CallbackTypes.h
//  AppleKits4Unity
//
//  Created by Alex Griffin on 18/2/20.
//  Copyright © 2020 Forbidden Cactus. All rights reserved.
//

#ifndef CallbackTypes_h
#define CallbackTypes_h

typedef int CallbackKey;
typedef void (*RESULT_CALLBACK)(CallbackKey callbackKey, bool isSuccessful, const char * errorMessage);
typedef void (*FILERESULT_CALLBACK)(int callbackKey, bool isSuccessful, const char* filePath, const char * errorMessage);


#endif /* CallbackTypes_h */
