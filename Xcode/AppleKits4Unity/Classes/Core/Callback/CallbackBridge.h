//
//  CallbackBridge.h
//  AppleKits4Unity
//
//  Created by Alex Griffin on 20/2/20.
//  Copyright © 2020 Forbidden Cactus. All rights reserved.
//

#include "CallbackTypes.h"

extern "C"
{

void set_resultcallback(RESULT_CALLBACK callback);
void set_fileresultcallback(FILERESULT_CALLBACK callback);
void set_stringresultcallback(STRINGRESULT_CALLBACK callback);
void set_logcallback(UNITY_LOG callback);

}
