//
// Created by Agnieszka Szczurek on 04.06.15.
// Copyright (c) 2015 AgnieszkaSzczurek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RemoteClientDelegate.h"

@class RegistrationDTO;


@interface RegistrationRequest : NSObject

@property RegistrationDTO *registrationDTO;

@end

@protocol RegistrationDelegate <RemoteClientDelegate>

- (void)onRegistrationSuccess:(NSString *)response;

@end