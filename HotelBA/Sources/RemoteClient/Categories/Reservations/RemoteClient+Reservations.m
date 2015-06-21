//
// Created by Agnieszka Szczurek on 20.06.15.
// Copyright (c) 2015 AgnieszkaSzczurek. All rights reserved.
//

#import "RemoteClient+Reservations.h"
#import "ReservationsRequest.h"
#import "ErrorResponse.h"
#import "ReservationDTO.h"
#import "AccountTokenSingleton.h"
#import "AFHTTPRequestOperationManager.h"


@implementation RemoteClient (Reservations)


- (void)deleteReservationWithId:(ReservationsRequest *) request withDelegate:(id <DeleteReservationsById>) delegate {

    [self.httpClient.requestSerializer setValue:[AccountTokenSingleton sharedManager].token forHTTPHeaderField:@"Token-Auth"];
    NSString *path = [NSString stringWithFormat:@"reservation/reservation/%@",request.reservationId];

    [self deletePath:path params:nil success:^(NSDictionary *response) {
        [delegate onDeleteReservationByIdSuccess];

    } andDelegate:delegate];


}

- (void)getReservationsWithRequest:(ReservationsRequest *) request withDelegate:(id <GetAllReservationsById>) delegate {
    [self.httpClient.requestSerializer setValue:[AccountTokenSingleton sharedManager].token forHTTPHeaderField:@"Token-Auth"];
    NSString *path = [NSString stringWithFormat:@"reservation/hotel/%@",request.reservationId];

    [self getPath:path params:nil success:^(NSDictionary *response) {
        if(response != nil) {
            ReservationResponse *reservationResponse = [[ReservationResponse alloc] init];
            NSArray *hotels = [self parseReservationResponseWithDictionary:response];

            reservationResponse.reservationsArray = hotels;
            [delegate onGetAllReservationsByIdSuccess:reservationResponse];
        }
        else {
            ErrorResponse *errResponse = [[ErrorResponse alloc] initWithError:nil];
            [delegate onRemoteClientError:errResponse];
        }


    } andDelegate:delegate];

}

-(NSArray *) parseReservationResponseWithDictionary:(NSDictionary *) dictionary {
    ReservationDTO *reservationDTO = [[ReservationDTO alloc] init];
    NSArray *dictionaryArray = (NSArray *)dictionary;
    NSMutableArray *arrayOfReservations = [[NSMutableArray alloc] init];

    for(int i=0; i< dictionaryArray.count; i++) {
        NSDictionary *dict = dictionaryArray[(NSUInteger) i];
        reservationDTO = [ReservationDTO createReservationWithDictionary:dict];
        [arrayOfReservations addObject:reservationDTO];
    }

    return [NSArray arrayWithArray:arrayOfReservations];
}


@end