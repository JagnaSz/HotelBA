//
// Created by Agnieszka Szczurek on 04.06.15.
// Copyright (c) 2015 AgnieszkaSzczurek. All rights reserved.
//

#import "ErrorResponse.h"


@implementation ErrorResponse

- (instancetype)initWithError:(NSError *)error {

    self = [super init];
    if (self) {
        self.error = error;
    }

    return self;

}

+ (instancetype)responseWithError:(NSError *)error {

    return [[self alloc] initWithError:error];

}

@end