//
// Created by Agnieszka Szczurek on 20.06.15.
// Copyright (c) 2015 AgnieszkaSzczurek. All rights reserved.
//

#import "AccountTokenSingleton.h"

@interface AccountTokenSingleton()

@end

@implementation AccountTokenSingleton {
}

+ (instancetype) sharedManager {
    static AccountTokenSingleton *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [self new];
    });
    return sharedMyManager;
}

- (id)init {
    self = [super init];
    if (self) {
        _token = @"";
    }
    return self;
}
@end