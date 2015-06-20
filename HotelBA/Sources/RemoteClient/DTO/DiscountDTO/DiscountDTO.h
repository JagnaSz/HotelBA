//
// Created by Agnieszka Szczurek on 20.06.15.
// Copyright (c) 2015 AgnieszkaSzczurek. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DiscountDTO : NSObject

@property (nonatomic, assign) NSInteger discountId;
@property (nonatomic, strong) NSString *discountName;
@property (nonatomic, strong) NSString *discountDescription;
@property (nonatomic, assign) NSInteger price;

+ (DiscountDTO *)createDiscountWithDictionary:(NSDictionary *)dict;
@end