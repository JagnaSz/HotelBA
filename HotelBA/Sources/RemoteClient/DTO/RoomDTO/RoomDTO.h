//
// Created by Agnieszka Szczurek on 20.06.15.
// Copyright (c) 2015 AgnieszkaSzczurek. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RoomTypeDTO;


@interface RoomDTO : NSObject

@property (nonatomic, assign) NSInteger roomId;
@property (nonatomic, assign) NSInteger floor;
@property (nonatomic, assign) NSInteger number;
@property (nonatomic, assign) NSInteger roomSize;
@property (nonatomic, strong) RoomTypeDTO *roomTypeDTO;

+ (RoomDTO *) createRoomWithDictionary:(NSDictionary *) dict;
@end