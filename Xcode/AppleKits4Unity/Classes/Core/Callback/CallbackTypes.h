//
//  CallbackTypes.h
//  AppleKits4Unity
//
//  Created by Alex Griffin on 18/2/20.
//  Copyright © 2020 Forbidden Cactus. All rights reserved.
//

#ifndef CallbackTypes_h
#define CallbackTypes_h

typedef void (*UNITY_LOG)(const char* logMessage);

typedef int CallbackKey;
typedef void (*RESULT_CALLBACK)(CallbackKey callbackKey, bool isSuccessful, const char * errorMessage);
typedef void (*FILERESULT_CALLBACK)(CallbackKey callbackKey, bool isSuccessful, const char* filePath, const char * errorMessage);
typedef void (*STRINGRESULT_CALLBACK)(CallbackKey callbackKey, bool isSuccessful, const char* resultString, const char * errorMessage);



#endif /* CallbackTypes_h */
