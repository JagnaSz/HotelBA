//
// Created by Agnieszka Szczurek on 20.06.15.
// Copyright (c) 2015 AgnieszkaSzczurek. All rights reserved.
//

#import "DiscountDTO.h"


@implementation DiscountDTO {

}

+ (DiscountDTO *)createDiscountWithDictionary:(NSDictionary *) dict {

    DiscountDTO *discountDTO = [[DiscountDTO alloc] init];
    discountDTO.discountId = [dict[@"id"] integerValue];
    discountDTO.discountName = dict[@"name"];
    discountDTO.discountDescription = dict[@"description"];
    discountDTO.price = [dict[@"price"] integerValue];

    return discountDTO;
}
@end