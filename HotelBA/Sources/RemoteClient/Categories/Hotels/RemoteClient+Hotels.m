//
// Created by Agnieszka Szczurek on 19.06.15.
// Copyright (c) 2015 AgnieszkaSzczurek. All rights reserved.
//

#import "RemoteClient+Hotels.h"
#import "HotelResponse.h"
#import "ErrorResponse.h"
#import "HotelDTO.h"
#import "AddressDTO.h"
#import "ContactDTO.h"
#import "AFHTTPRequestOperationManager.h"
#import "AccountTokenSingleton.h"


@implementation RemoteClient (Hotels)

- (void)getAllHotelsWithDelegate:(id <GetAllHotelsDelegate>)delegate {
    [self.httpClient.requestSerializer setValue:[AccountTokenSingleton sharedManager].token forHTTPHeaderField:@"Token-Auth"];
    NSString *path = @"hotel/hotels";

    [self getPath:path
           params:nil success:^(NSDictionary *response) {
                if(response != nil) {
                    HotelResponse *hotelResponse = [[HotelResponse alloc] init];
                    NSArray *hotels = [self parseHotelResponseWithDictionary:response];

                    hotelResponse.hotelsArray = hotels;
                    [delegate onGetAllHotelsSuccess:hotelResponse];
                }
                else {
                    ErrorResponse *errResponse = [[ErrorResponse alloc] initWithError:nil];
                    [delegate onRemoteClientError:errResponse];
                }

            }

      andDelegate:delegate];

}

- (NSArray *)parseHotelResponseWithDictionary:(NSDictionary *) dictionary {

    HotelDTO *hotelDTO = [[HotelDTO alloc] init];
    NSArray *dictionaryArray = (NSArray *)dictionary;
    NSMutableArray *arrayOfHotels = [[NSMutableArray alloc] init];

    for(int i=0; i< dictionaryArray.count; i++) {
        NSDictionary *dict = dictionaryArray[(NSUInteger) i];
        hotelDTO = [self parseHotel:dict];
        [arrayOfHotels addObject:hotelDTO];
    }

    return [NSArray arrayWithArray:arrayOfHotels];
}

- (HotelDTO *)parseHotel:(NSDictionary *) dict {
    HotelDTO *hotel = [[HotelDTO alloc] init];
    AddressDTO *address = [[AddressDTO alloc] init];
    ContactDTO *contact = [[ContactDTO alloc] init];

    contact.mail = [dict[@"contact"] objectForKey:@"mail"];
    contact.phone = [dict[@"contact"] objectForKey:@"phone"];
    address.street = [dict[@"address"] objectForKey:@"street"];
    address.city = [dict[@"address"] objectForKey:@"city"];
    address.flatNumber = [dict[@"address"] objectForKey:@"flatNumber"];
    address.postalCode = [dict[@"address"] objectForKey:@"postalCode"];
    address.country = [dict[@"address"] objectForKey:@"country"];
    address.houseNumber = [dict[@"address"] objectForKey:@"houseNumber"];

    hotel.addressDTO = address;
    hotel.contactDTO = contact;
    hotel.hotelDescription = dict[@"desc"];
    hotel.hotelName = dict[@"name"];
    hotel.hotelId = [dict[@"id"] integerValue];

    return hotel;
}

@end