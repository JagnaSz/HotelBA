//
// Created by Agnieszka Szczurek on 20.06.15.
// Copyright (c) 2015 AgnieszkaSzczurek. All rights reserved.
//

#import <GRKAlertBlocks/UIAlertView+GRKAlertBlocks.h>
#import <REFrostedViewController/UIViewController+REFrostedViewController.h>
#import <REFrostedViewController/REFrostedViewController.h>
#import "HotelReservationsViewController.h"
#import "HotelsReservationsTableViewCell.h"
#import "RemoteClient.h"
#import "ReservationsRequest.h"
#import "RemoteClient+Reservations.h"
#import "ErrorResponse.h"


@implementation HotelReservationsViewController {

}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.frostedViewController.panGestureEnabled = NO;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.frostedViewController.panGestureEnabled = YES;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"HotelsReservationsTableViewCell" bundle:nil] forCellReuseIdentifier:@"hotelsReservationsCell"];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.view.backgroundColor = [UIColor colorWithRed:205/255.0 green:201/255.0 blue:194/255.0 alpha:1.0];
    self.tableView.allowsMultipleSelectionDuringEditing = NO;
    [self.tableView setEditing:YES animated:YES];

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

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {

    NSUInteger row = (NSUInteger) [indexPath row];
    NSUInteger count = [self.reservationDetail count];

    if (row < count) {
        return UITableViewCellEditingStyleDelete;
    } else {
        return UITableViewCellEditingStyleNone;
    }
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSMutableArray *mutableArray = [NSMutableArray arrayWithArray:self.reservationDetail];
        [mutableArray removeObjectAtIndex:(NSUInteger) indexPath.row];
        self.reservationDetail = [NSArray arrayWithArray:mutableArray];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else {
        NSLog(@"Unhandled editing style! %d", editingStyle);
    }
}

- (void)tableView:(UITableView *)tableView didEndEditingRowAtIndexPath:(NSIndexPath *)indexPath {

    [tableView reloadData];
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