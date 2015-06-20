//
// Created by Agnieszka Szczurek on 20.06.15.
// Copyright (c) 2015 AgnieszkaSzczurek. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RoomDTO;
@class RegistrationDTO;
@class DiscountDTO;


@interface ReservationDTO : NSObject

@property (nonatomic, assign) NSInteger reservationID;
@property (nonatomic, strong) RoomDTO *roomDTO;
@property (nonatomic, strong) RegistrationDTO *registrationDTO;
@property (nonatomic, strong) DiscountDTO *discountDTO;
@property (nonatomic, strong) NSString *startDate;
@property (nonatomic, strong) NSString *endDate;
@property (nonatomic, assign) BOOL paid;
@property (nonatomic, strong) NSArray *additionalServices;

+ (ReservationDTO *) createReservationWithDictionary: (NSDictionary *) dict;

@end