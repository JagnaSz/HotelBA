//
// Created by Agnieszka Szczurek on 20.06.15.
// Copyright (c) 2015 AgnieszkaSzczurek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"
#import "ReservationsRequest.h"

@protocol ReservationComplaintPressedProtocol;
@class NewComplaintViewController;

@interface HotelReservationsViewController : UITableViewController <GetAllReservationsById, UIGestureRecognizerDelegate, DeleteReservationsById, ReservationComplaintPressedProtocol>
@property (nonatomic, assign) NSInteger hotelId;
@property(nonatomic, strong) NSArray *reservationDetail;
@end

@protocol ReservationComplaintPressedProtocol <NSObject>

- (void)pushComplaintViewController:(NewComplaintViewController *) complaintsViewController;

@end