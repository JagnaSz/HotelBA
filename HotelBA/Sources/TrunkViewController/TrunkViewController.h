//
//  TrunkViewController.h
//  HotelBA
//
//  Created by Agnieszka Szczurek on 22.05.2015.
//  Copyright (c) 2015 AgnieszkaSzczurek. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@class LoginViewController;
@class RegisterViewController;
@class MenuTableViewController;

@interface TrunkViewController : BaseViewController

@property (nonatomic, strong) LoginViewController *loginViewController;
@property (nonatomic, strong) RegisterViewController *registerViewController;

@property(nonatomic, strong) MenuTableViewController *menuTableView;
@end
