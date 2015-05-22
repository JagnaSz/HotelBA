//
//  MenuTableViewController.m
//  HotelBA
//
//  Created by Agnieszka Szczurek on 21.05.2015.
//  Copyright (c) 2015 AgnieszkaSzczurek. All rights reserved.
//

#import <REFrostedViewController/REFrostedViewController.h>
#import "MenuTableViewController.h"
#import "ProfileHeader.h"
#import "MenuTableDataSource.h"
#import "MenuTableViewCell.h"
#import "MenuTableViewDelegate.h"
#import "MenuOptionModel.h"
#import "TrunkViewController.h"
#import "HotelNavigationController.h"

@interface MenuTableViewController () <MenuOptionsProtocol>

@property (nonatomic, strong) MenuTableDataSource *menuDataSource;
@property (nonatomic, strong) HotelNavigationController *hotelNavigationController;
@property(nonatomic, strong) MenuTableViewDelegate *menuDelegate;
@end

@implementation MenuTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupTableView];

    self.hotelNavigationController = [self.storyboard instantiateViewControllerWithIdentifier:@"centerController"];

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

    switch(model.type) {
        case MenuTypeLogin:
            [self createTrunkScreen];
            break;
        case MenuTypeAccount:
            [self createAccountScreen];
            break;
        case MenuTypeReservations:
            [self createReservationsScreen];
            break;
        case MenuTypeAbout:
            [self createAboutScreen];
            break;
        default:
            NSLog(@"Nieznana komenda");
            break;
    }

}

- (void)createAboutScreen {

}

- (void)createReservationsScreen {

}

- (void)createAccountScreen {

}

- (void)createTrunkScreen {
    TrunkViewController *trunk = [self.storyboard instantiateViewControllerWithIdentifier:@"trunkScreen"];
    self.hotelNavigationController.viewControllers = @[trunk];
    self.frostedViewController.contentViewController = self.hotelNavigationController;
    [self.frostedViewController hideMenuViewController];
}


@end
