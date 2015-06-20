//
// Created by Agnieszka Szczurek on 04.06.15.
// Copyright (c) 2015 AgnieszkaSzczurek. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface AddressDTO : NSObject
@property (nonatomic, strong) NSString *street;
@property (nonatomic, strong) NSString *houseNumber;
@property (nonatomic, strong) NSString *flatNumber;
@property (nonatomic, strong) NSString *postalCode;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *state;
@property (nonatomic, strong) NSString *country;

+ (AddressDTO *)createAddressWithDictionary:(NSDictionary *)dictionary;
@end