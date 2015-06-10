//
// Created by Agnieszka Szczurek on 10.06.15.
// Copyright (c) 2015 AgnieszkaSzczurek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RemoteClient.h"

@class LoginRequest;
@protocol GetUserAccountDelegate;

@interface RemoteClient (Login)
- (void)getUserAccount:(LoginRequest *)request withDelegate:(id <GetUserAccountDelegate>)delegate;
@end