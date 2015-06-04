//
// Created by Agnieszka Szczurek on 04.06.15.
// Copyright (c) 2015 AgnieszkaSzczurek. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ErrorResponse;

@protocol RemoteClientDelegate <NSObject>
- (void)onRemoteClientError:(ErrorResponse *)error;
@end