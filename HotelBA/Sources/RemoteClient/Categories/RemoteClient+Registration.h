//
// Created by Agnieszka Szczurek on 04.06.15.
// Copyright (c) 2015 AgnieszkaSzczurek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RemoteClient.h"

@class RegistrationRequest;
@protocol RegistrationDelegate;

@interface RemoteClient (Registration)

- (void)sendRegistration:(RegistrationRequest *)request withDelegate:(id <RegistrationDelegate>)delegate;

@end