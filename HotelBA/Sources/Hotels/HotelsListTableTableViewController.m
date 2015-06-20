//
//  HotelsListTableTableViewController.m
//  HotelBA
//
//  Created by Agnieszka Szczurek on 19.06.2015.
//  Copyright (c) 2015 AgnieszkaSzczurek. All rights reserved.
//

#import <GRKAlertBlocks/UIAlertView+GRKAlertBlocks.h>
#import "HotelsListTableTableViewController.h"
#import "HotelResponse.h"
#import "ErrorResponse.h"
#import "RemoteClient.h"
#import "RemoteClient+Hotels.h"
#import "HotelTableViewCell.h"
#import "HotelDTO.h"
#import "HotelDetailViewController.h"
#import "UIImage+Helper.h"
#import <REFrostedViewController/REFrostedViewController.h>

@interface HotelsListTableTableViewController ()<GetAllHotelsDelegate>
@property (weak, nonatomic) IBOutlet UIButton *menuButton;
@property (nonatomic, strong) NSArray *hotels;

@end

@implementation HotelsListTableTableViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:205/255.0 green:201/255.0 blue:194/255.0 alpha:1.0];

    RemoteClient *remoteClient = [[RemoteClient alloc] init];
    [remoteClient getAllHotelsWithDelegate:self];
    [self bindEvents];
    [self setupMenuButton];
}

- (void)bindEvents {

    [self.menuButton addTarget:self action:@selector(eventMenuButtonPressed:) forControlEvents: UIControlEventTouchUpInside];

}

- (void)setupMenuButton {

    UIImage *normalImage = [UIImage imageNamed:@"menu"];
    normalImage = [normalImage imageByFilledWithColor:[UIColor grayColor]];

    [self.menuButton setImage:normalImage forState:UIControlStateNormal];
    [self.menuButton setImage:normalImage forState:UIControlStateSelected];

    UIImage *highlightedImage = [UIImage imageNamed: @"menu"];
    highlightedImage = [highlightedImage imageByFilledWithColor:[UIColor lightGrayColor]];
    [self.menuButton setImage:highlightedImage forState:UIControlStateHighlighted];

}

- (void)eventMenuButtonPressed:(id)eventMenuButtonPressed {

    [self.view endEditing:YES];
    [self.frostedViewController.view endEditing:YES];

    [self.frostedViewController presentMenuViewController];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.hotels.count;
}

- (void)onGetAllHotelsSuccess:(HotelResponse *)response {
    self.hotels = response.hotelsArray;
    [self.tableView reloadData];
}

- (void)onRemoteClientError:(ErrorResponse *)error {
    UIAlertView *alertView = [UIAlertView alertWithTitle:@"Error" message:error.description];
    [alertView addButtonWithTitle:@"OK"];
    [alertView show];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HotelTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"hotelCell" forIndexPath:indexPath];
    HotelDTO *hotelDTO = self.hotels[(NSUInteger) indexPath.row];
    cell.hotelNameLabel.text = hotelDTO.hotelName;
    return cell;
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"hotel"])
    {
        // Get reference to the destination view controller
        HotelDetailViewController *detailViewController = [segue destinationViewController];
        NSIndexPath *myIndexPath = [self.tableView indexPathForSelectedRow];
        HotelDTO *hotelDTO = self.hotels[(NSUInteger) myIndexPath.row];
        detailViewController.hotelDTO = hotelDTO;
    }

}


@end
