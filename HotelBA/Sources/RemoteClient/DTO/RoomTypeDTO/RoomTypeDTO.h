//
// Created by Agnieszka Szczurek on 20.06.15.
// Copyright (c) 2015 AgnieszkaSzczurek. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface RoomTypeDTO : NSObject

@property (nonatomic, assign) NSInteger roomTypeId;
@property (nonatomic, strong) NSString *roomTypeName;
@property (nonatomic, strong) NSString *roomTypeDescription;
@property (nonatomic, assign) NSInteger roomTypePrice;

+ (RoomTypeDTO *) createRoomTypeWithDictionary:(NSDictionary *) dict;
@end