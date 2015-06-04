//
// Created by Agnieszka Szczurek on 04.06.15.
// Copyright (c) 2015 AgnieszkaSzczurek. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AddressDTO;
@class ContactDTO;


@interface RegistrationDTO : NSObject

@property (nonatomic, strong) NSString *password;
@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, strong) NSString *birthDate;
@property (nonatomic, strong) AddressDTO *addressDTO;
@property (nonatomic, strong) ContactDTO *contactDTO;
@property (nonatomic, strong) NSString *regulaminAccepted;
@end