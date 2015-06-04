//
// Created by Agnieszka Szczurek on 04.06.15.
// Copyright (c) 2015 AgnieszkaSzczurek. All rights reserved.
//

#import "RemoteClient+Registration.h"
#import "RegistrationRequest.h"
#import "RegistrationDTO.h"
#import "AddressDTO.h"
#import "ContactDTO.h"
#import "ErrorResponse.h"


@implementation RemoteClient (Registration)

- (void)sendRegistration:(RegistrationRequest *)request withDelegate:(id <RegistrationDelegate>)delegate {

    NSString *path = @"registration/account";

    [self postPath:path
            params:[self createDictionaryWithRegistration:request] success:^void(NSDictionary *responseDictionary) {

                if (responseDictionary != nil) {

                    [delegate onSendPhotoReportSuccess:[NSString stringWithFormat:@"%@",responseDictionary]];

                } else {
//                    ErrorResponse *response = [ErrorResponse objectForDictionary:responseDictionary];
                    ErrorResponse *response = [[ErrorResponse alloc] initWithError:nil];
                    [delegate onRemoteClientError:response];
                }

            } andDelegate:delegate];

}

- (NSDictionary *)createDictionaryWithRegistration:(RegistrationRequest *)request {
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];

    params[@"password"] = request.registrationDTO.password;
    params[@"firstName"] = request.registrationDTO.firstName;
    params[@"lastName"] = request.registrationDTO.lastName;
    params[@"birthDate"] = request.registrationDTO.birthDate;
    params[@"accountType"] = @"E";
    params[@"accountStatus"] = @"A";
    params[@"address"] = [self createDictionaryWithAddress:request.registrationDTO.addressDTO];
    params[@"contact"] = [self createDictionaryWithContact:request.registrationDTO.contactDTO];
    params[@"regulaminAccepted"] = request.registrationDTO.regulaminAccepted;
    return [NSDictionary dictionaryWithDictionary:params];
}

- (NSDictionary *)createDictionaryWithContact:(ContactDTO *)dto {

    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    dict[@"phone"] = dto.phone;
    dict[@"mail"] = dto.mail;
    dict[@"mailPermission"] = dto.mailPermission;
    dict[@"smsPermission"] = dto.smsPermission;
    dict[@"faxPermission"] = dto.faxPermission;

    return [NSDictionary dictionaryWithDictionary:dict];
}

- (NSDictionary *)createDictionaryWithAddress:(AddressDTO *)dto {
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];

    dict[@"street"] = dto.street;
    dict[@"houseNumber"] = dto.houseNumber;
    dict[@"flatNumber"] = dto.flatNumber;
    dict[@"postalCode"] = dto.postalCode;
    dict[@"city"] = dto.city;
    dict[@"state"] = dto.state;
    dict[@"country"] = dto.country;

    return [NSDictionary dictionaryWithDictionary:dict];
}

@end