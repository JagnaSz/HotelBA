//
// Created by Agnieszka Szczurek on 19.06.15.
// Copyright (c) 2015 AgnieszkaSzczurek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RemoteClientDelegate.h"


@interface HotelResponse : NSObject

@property(nonatomic, strong) NSArray *hotelsArray;

@end

@protocol GetAllHotelsDelegate <RemoteClientDelegate>

- (void)onGetAllHotelsSuccess:(HotelResponse *)response;

@end