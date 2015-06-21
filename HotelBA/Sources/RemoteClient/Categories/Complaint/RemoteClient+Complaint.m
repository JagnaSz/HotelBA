//
// Created by Agnieszka Szczurek on 21.06.15.
// Copyright (c) 2015 AgnieszkaSzczurek. All rights reserved.
//

#import <AFNetworking/AFHTTPRequestOperationManager.h>
#import "RemoteClient+Complaint.h"
#import "ComplaintRequest.h"
#import "AccountTokenSingleton.h"
#import "ComplaintDTO.h"
#import "ErrorResponse.h"


@implementation RemoteClient (Complaint)

- (void)getComplaintWithRequest:(ComplaintRequest *)request withDelegate:(id <GetComplaintDelegate>)delegate {

    [self.httpClient.requestSerializer setValue:[AccountTokenSingleton sharedManager].token forHTTPHeaderField:@"Token-Auth"];
    NSString *path = [NSString stringWithFormat:@"complaint/complaint/reservation/%@",request.reservationId];

    [self getPath:path params:nil success:^(NSDictionary *response) {

        if(response != nil) {
            ComplaintDTO *complaintDTO = [ComplaintDTO createComplaintWithDicionary:response];
            ComplaintResponse *complaintResponse = [[ComplaintResponse alloc] init];
            complaintResponse.complaintDTO = complaintDTO;

            [delegate onGetComplaintSuccess:complaintResponse];
        }
        else {
            ComplaintDTO *complaintDTO = [[ComplaintDTO alloc] init];
            complaintDTO.complaintDescription = @"";
            ComplaintResponse *complaintResponse = [[ComplaintResponse alloc] init];
            complaintResponse.complaintDTO = complaintDTO;

            [delegate onGetComplaintSuccess:complaintResponse];
        }
    } andDelegate:delegate];

}

@end