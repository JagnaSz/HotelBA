//
// Created by Agnieszka Szczurek on 20.06.15.
// Copyright (c) 2015 AgnieszkaSzczurek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RemoteClientDelegate.h"


@interface ReservationsRequest : NSObject
@property (nonatomic, strong) NSString *reservationId;
@end

@interface ReservationResponse : NSObject

@property(nonatomic, strong) NSArray *reservationsArrray;

@end

@protocol GetAllReservationsById <RemoteClientDelegate>

- (void)onGetAllReservationsByIdSuccess:(ReservationResponse *)response;

@end