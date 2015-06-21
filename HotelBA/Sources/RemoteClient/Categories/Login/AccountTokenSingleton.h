//
// Created by Agnieszka Szczurek on 20.06.15.
// Copyright (c) 2015 AgnieszkaSzczurek. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface AccountTokenSingleton : NSObject

@property (nonatomic, copy) NSString *token;
+ (instancetype)sharedManager;

+ (void)clearData;
@end