//
// Created by Agnieszka Szczurek on 04.06.15.
// Copyright (c) 2015 AgnieszkaSzczurek. All rights reserved.
//

#import "ContactDTO.h"


@implementation ContactDTO {

}
+ (ContactDTO *)createContactWithDictionary:(NSDictionary *)dict {

    ContactDTO *contactDTO = [[ContactDTO alloc] init];
    contactDTO.phone = dict[@"phone"];
    contactDTO.mail =  dict[@"mail"];

    return contactDTO;
}
@end