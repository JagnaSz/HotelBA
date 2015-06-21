//
// Created by Agnieszka Szczurek on 21.06.15.
// Copyright (c) 2015 AgnieszkaSzczurek. All rights reserved.
//

#import "ComplaintDTO.h"


@implementation ComplaintDTO {

}


+ (ComplaintDTO *)createComplaintWithDicionary:(NSDictionary *)dictionary {

    ComplaintDTO *complaintDTO = [[ComplaintDTO alloc] init];
    complaintDTO.complaintDescription = dictionary[@"description"];

    return  complaintDTO;
}
@end