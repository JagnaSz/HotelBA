//
// Created by Agnieszka Szczurek on 20.06.15.
// Copyright (c) 2015 AgnieszkaSzczurek. All rights reserved.
//

#import "RoomDTO.h"
#import "RoomTypeDTO.h"


@implementation RoomDTO {

}
+ (RoomDTO *)createRoomWithDictionary:(NSDictionary *)dict {
    RoomDTO *roomDTO = [[RoomDTO alloc] init];
    roomDTO.roomId = [dict[@"id"] integerValue];
    roomDTO.roomTypeDTO = [RoomTypeDTO createRoomTypeWithDictionary:dict];
    roomDTO.floor = [dict[@"floor"] integerValue];
    roomDTO.number = [dict[@"number"] integerValue];
    roomDTO.roomSize = [dict[@"size"] integerValue];

    return roomDTO;
}

@end