//
// Created by Agnieszka Szczurek on 04.06.15.
// Copyright (c) 2015 AgnieszkaSzczurek. All rights reserved.
//

#import "RegistrationDTO.h"
#import "AddressDTO.h"
#import "ContactDTO.h"


@implementation RegistrationDTO {

}

+ (RegistrationDTO *)createAccountWithDicitonary:(NSDictionary *)request {

    RegistrationDTO *registrationDTO = [[RegistrationDTO alloc] init];
    registrationDTO.password = request[@"password"];
    registrationDTO.firstName = request[@"firstName"];
    registrationDTO.lastName = request[@"lastName"];
    registrationDTO.birthDate = request[@"birthDate"];
    registrationDTO.addressDTO = [AddressDTO createAddressWithDictionary:request];
    registrationDTO.contactDTO = [ContactDTO createContactWithDictionary:request];

    return registrationDTO;
}



@end