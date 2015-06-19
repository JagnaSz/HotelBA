//
// Created by Agnieszka Szczurek on 19.06.15.
// Copyright (c) 2015 AgnieszkaSzczurek. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AddressDTO;
@class ContactDTO;


@interface HotelDTO : NSObject

@property (nonatomic, assign) NSInteger hotelId;
@property (nonatomic, strong) NSString *hotelName;
@property (nonatomic, strong) NSString *hotelDescription;
@property (nonatomic, strong) AddressDTO *addressDTO;
@property (nonatomic, strong) ContactDTO *contactDTO;

@end