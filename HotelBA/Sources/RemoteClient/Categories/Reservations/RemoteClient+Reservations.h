//
// Created by Agnieszka Szczurek on 20.06.15.
// Copyright (c) 2015 AgnieszkaSzczurek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RemoteClient.h"

@class ReservationsRequest;
@protocol GetAllReservationsById;

@interface RemoteClient (Reservations)
- (void)getReservationsWithRequest:(ReservationsRequest *)request withDelegate:(id <GetAllReservationsById>)delegate;

@end