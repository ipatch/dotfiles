//
//  main.m
//  xpc_set_event_stream_handler
//
//  Created by Ford Parsons on 10/23/17.
//  Copyright © 2017 Ford Parsons. All rights reserved.
//
// NOTE: change `NULL`, 2nd argument to path of exe / .sh to execute

#import <Foundation/Foundation.h>
#include <xpc/xpc.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
        xpc_set_event_stream_handler("com.apple.iokit.matching", NULL, ^(xpc_object_t _Nonnull object) {
            const char *event = xpc_dictionary_get_string(object, XPC_EVENT_KEY_NAME);
            NSLog(@"%s", event);
            dispatch_semaphore_signal(semaphore);
        });
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        if(argc >= 2) {
            execv(argv[1], (char **)argv+1);
        }
    }
}
