//
// Created by Agnieszka Szczurek on 21.06.15.
// Copyright (c) 2015 AgnieszkaSzczurek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RemoteClientDelegate.h"

@class ComplaintDTO;


@interface ComplaintRequest : NSObject

@property (nonatomic, strong) NSString *reservationId;

@end

@interface ComplaintResponse : NSObject

@property (nonatomic, strong) ComplaintDTO *complaintDTO;

@end

@protocol GetComplaintDelegate <RemoteClientDelegate>

- (void)onGetComplaintSuccess:(ComplaintResponse *)response;

@end