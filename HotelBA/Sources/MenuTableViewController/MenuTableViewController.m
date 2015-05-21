//
//  MenuTableViewController.m
//  HotelBA
//
//  Created by Agnieszka Szczurek on 21.05.2015.
//  Copyright (c) 2015 AgnieszkaSzczurek. All rights reserved.
//

#import "MenuTableViewController.h"
#import "ProfileHeader.h"
#import "MenuTableDataSource.h"
#import "MenuTableViewCell.h"
#import "MenuTableViewDelegate.h"
#import "MenuOptionModel.h"

@interface MenuTableViewController () <MenuOptionsProtocol>

@property (nonatomic, strong) MenuTableDataSource *menuDataSource;

@property(nonatomic, strong) MenuTableViewDelegate *menuDelegate;
@end

@implementation MenuTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupTableView];

}

- (void)setupTableView {

    self.tableView.separatorColor = [UIColor colorWithRed:150/255.0f green:161/255.0f blue:177/255.0f alpha:1.0f];
    self.tableView.opaque = NO;
    self.tableView.backgroundColor = [UIColor clearColor];

    [self.tableView registerNib:[UINib nibWithNibName:@"ProfileHeader" bundle:nil] forHeaderFooterViewReuseIdentifier:ProfileHeaderIdentifier];

    self.menuDataSource = [[MenuTableDataSource alloc] initWithCellIdentifier:MenuTableViewCellIdentifier isUserRegistered:NO];
    self.tableView.dataSource = self.menuDataSource;
    [self.tableView registerNib:[MenuTableViewCell nib] forCellReuseIdentifier:MenuTableViewCellIdentifier];

    self.menuDelegate = [[MenuTableViewDelegate alloc] initWithItems:self.menuDataSource.items];
    self.tableView.delegate = self.menuDelegate;
    self.menuDelegate.optionsDelegate = self;

    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];

}

- (void)didSelectOptionWithModel:(MenuOptionModel *)model {

}


@end
