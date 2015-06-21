//
// Created by Agnieszka Szczurek on 20.06.15.
// Copyright (c) 2015 AgnieszkaSzczurek. All rights reserved.
//

#import "ReservationDTO.h"
#import "RoomDTO.h"
#import "RegistrationDTO.h"
#import "DiscountDTO.h"


@implementation ReservationDTO {

}
+ (ReservationDTO *)createReservationWithDictionary:(NSDictionary *)dict {
    ReservationDTO *reservationDTO = [[ReservationDTO alloc] init];

    reservationDTO.additionalServices = dict[@"additionalServices"];
    reservationDTO.paid = [dict[@"paid"] boolValue];
   // reservationDTO.discountDTO = [DiscountDTO createDiscountWithDictionary:dict[@"discountType"]];
    reservationDTO.endDate = dict[@"endDate"];
    reservationDTO.startDate = dict[@"startDate"];
    reservationDTO.registrationDTO = [RegistrationDTO createAccountWithDicitonary:dict[@"account"]];
    reservationDTO.reservationID = [dict[@"id"] integerValue];
    reservationDTO.roomDTO = [RoomDTO createRoomWithDictionary:dict[@"room"]];

    return  reservationDTO;

}

@end