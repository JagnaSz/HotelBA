//
// Created by Agnieszka Szczurek on 20.06.15.
// Copyright (c) 2015 AgnieszkaSzczurek. All rights reserved.
//

#import "RoomTypeDTO.h"


@implementation RoomTypeDTO {

}
+ (RoomTypeDTO *)createRoomTypeWithDictionary:(NSDictionary *)dict {
    RoomTypeDTO *roomTypeDTO = [[RoomTypeDTO alloc] init];

    roomTypeDTO.roomTypeId = [dict[@"id"] integerValue];
    roomTypeDTO.roomTypeName = dict[@"name"];
    roomTypeDTO.roomTypeDescription = dict[@"description"];
    roomTypeDTO.roomTypePrice = [dict[@"price"] integerValue];

    return roomTypeDTO;
}

@end