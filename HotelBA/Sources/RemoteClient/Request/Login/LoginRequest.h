//
// Created by Agnieszka Szczurek on 10.06.15.
// Copyright (c) 2015 AgnieszkaSzczurek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RemoteClientDelegate.h"


@interface LoginRequest : NSObject

@property(nonatomic, strong) NSString *email;
@property(nonatomic, strong) NSString *password;
@end

@interface LoginResponse : NSObject

@property(nonatomic, strong) NSDictionary *userAccount;
-(NSString *) userHonor;

- (NSString *)token;
@end

@protocol GetUserAccountDelegate <RemoteClientDelegate>

- (void)onGetUserAccountSuccess:(LoginResponse *)response;

@end
