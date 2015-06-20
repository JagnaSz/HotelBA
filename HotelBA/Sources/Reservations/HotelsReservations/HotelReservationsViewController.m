//
// Created by Agnieszka Szczurek on 20.06.15.
// Copyright (c) 2015 AgnieszkaSzczurek. All rights reserved.
//

#import <GRKAlertBlocks/UIAlertView+GRKAlertBlocks.h>
#import "HotelReservationsViewController.h"
#import "HotelsReservationsTableViewCell.h"
#import "RemoteClient.h"
#import "ReservationsRequest.h"
#import "RemoteClient+Reservations.h"
#import "ErrorResponse.h"


@implementation HotelReservationsViewController {

}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"HotelsReservationsTableViewCell" bundle:nil] forCellReuseIdentifier:@"hotelsReservationsCell"];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.view.backgroundColor = [UIColor colorWithRed:205/255.0 green:201/255.0 blue:194/255.0 alpha:1.0];

    RemoteClient *remoteClient = [[RemoteClient alloc] init];
    ReservationsRequest *request = [[ReservationsRequest alloc] init];
    request.reservationId = [NSString stringWithFormat:@"%d",self.hotelId];
    [remoteClient getReservationsWithRequest:request withDelegate:self];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HotelsReservationsTableViewCell *tableViewCell = [tableView dequeueReusableCellWithIdentifier:@"hotelsReservationsCell" forIndexPath:indexPath];
    [tableViewCell setupView:self.reservationDetail[(NSUInteger) indexPath.row]];
    return tableViewCell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.reservationDetail.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 200;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //[_objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else {
        NSLog(@"Unhandled editing style! %d", editingStyle);
    }
}

- (void)onGetAllReservationsByIdSuccess:(ReservationResponse *)response {
    self.reservationDetail = response.reservationsArrray;
    [self.tableView reloadData];
}

- (void)onRemoteClientError:(ErrorResponse *)error {
    UIAlertView *alertView = [UIAlertView alertWithTitle:@"Error" message:error.description];
    [alertView addButtonWithTitle:@"OK"];
    [alertView show];
}


@end