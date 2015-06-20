//
//  HotelsReservationsTableViewCell.h
//  HotelBA
//
//  Created by Agnieszka Szczurek on 20.06.2015.
//  Copyright (c) 2015 AgnieszkaSzczurek. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ReservationDTO;

@interface HotelsReservationsTableViewCell : UITableViewCell


- (void)setupView:(ReservationDTO *)reservation;
@end
