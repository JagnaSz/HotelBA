//
// Created by Agnieszka Szczurek on 04.06.15.
// Copyright (c) 2015 AgnieszkaSzczurek. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ErrorResponse : NSObject

@property (nonatomic, strong) NSError *error;

- (instancetype)initWithError:(NSError *)error;

+ (instancetype)responseWithError:(NSError *)error;


@end