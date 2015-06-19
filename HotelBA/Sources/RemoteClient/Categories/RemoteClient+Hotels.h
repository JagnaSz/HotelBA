//
// Created by Agnieszka Szczurek on 19.06.15.
// Copyright (c) 2015 AgnieszkaSzczurek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RemoteClient.h"

@class HotelResponse;
@protocol GetAllHotelsDelegate;

@interface RemoteClient (Hotels)

- (void)getAllHotelsWithDelegate:(id <GetAllHotelsDelegate>)delegate;
@end