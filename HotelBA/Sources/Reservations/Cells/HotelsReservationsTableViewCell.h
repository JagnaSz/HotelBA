//
//  HotelsReservationsTableViewCell.h
//  HotelBA
//
//  Created by Agnieszka Szczurek on 20.06.2015.
//  Copyright (c) 2015 AgnieszkaSzczurek. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ReservationDTO;
@protocol ReservationComplaintPressedProtocol;

@interface HotelsReservationsTableViewCell : UITableViewCell

@property (nonatomic, strong) id<ReservationComplaintPressedProtocol> cellDelegate;

@property(nonatomic, strong) NSString *emailText;

- (void)setupView:(ReservationDTO *)reservation;
@end
