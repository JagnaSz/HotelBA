//
// Created by Agnieszka Szczurek on 21.06.15.
// Copyright (c) 2015 AgnieszkaSzczurek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RemoteClient.h"

@class ComplaintRequest;
@protocol GetComplaintDelegate;

@interface RemoteClient (Complaint)


- (void)getComplaintWithRequest:(ComplaintRequest *)request withDelegate:(id <GetComplaintDelegate>)delegate;
@end