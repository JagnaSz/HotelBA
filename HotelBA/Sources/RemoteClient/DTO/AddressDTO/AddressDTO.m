//
// Created by Agnieszka Szczurek on 04.06.15.
// Copyright (c) 2015 AgnieszkaSzczurek. All rights reserved.
//

#import "AddressDTO.h"


@implementation AddressDTO {

}
+ (AddressDTO *)createAddressWithDictionary:(NSDictionary *)dict {
    AddressDTO *addressDTO = [[AddressDTO alloc] init];

    addressDTO.street = dict[@"street"];
    addressDTO.houseNumber =  dict[@"houseNumber"];
    addressDTO.flatNumber = dict[@"flatNumber"];
    addressDTO.postalCode = dict[@"postalCode"];
    addressDTO.city =  dict[@"city"];
    addressDTO.state = dict[@"state"];
    addressDTO.country =  dict[@"country"];

    return addressDTO;
}
@end