//
// Created by Agnieszka Szczurek on 04.06.15.
// Copyright (c) 2015 AgnieszkaSzczurek. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ContactDTO : NSObject
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *mail;
@property (nonatomic, strong) NSString *mailPermission;
@property (nonatomic, strong) NSString *smsPermission;
@property (nonatomic, strong) NSString *faxPermission;

+ (ContactDTO *)createContactWithDictionary:(NSDictionary *)dictionary;
@end