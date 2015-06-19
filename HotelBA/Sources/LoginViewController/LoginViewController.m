//
//  LoginViewController.m
//  HotelBA
//
//  Created by Agnieszka Szczurek on 04.06.2015.
//  Copyright (c) 2015 AgnieszkaSzczurek. All rights reserved.
//

#import <REFrostedViewController/UIViewController+REFrostedViewController.h>
#import <REFrostedViewController/REFrostedViewController.h>
#import "MenuTableViewController.h"
#import "LoginViewController.h"
#import "LoginRequest.h"
#import "ErrorResponse.h"
#import "RemoteClient.h"
#import "RemoteClient+Login.h"
#import "MenuTableViewController.h"
#import "UIAlertView+GRKAlertBlocks.h"
#import "CenterViewController.h"
#import "HotelNavigationController.h"
#import "AboutViewController.h"

@interface LoginViewController () <GetUserAccountDelegate>
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:205/255.0 green:201/255.0 blue:194/255.0 alpha:1.0];
    [self bindEvents];
}

- (void)bindEvents {
    [self.loginButton addTarget:self action:@selector(eventLoginButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)eventLoginButtonPressed:(id)eventLoginButtonPressed {
    RemoteClient *remoteClient = [[RemoteClient alloc] init];
    LoginRequest *loginRequest = [[LoginRequest alloc] init];
    loginRequest.email = self.emailTextField.text;
    loginRequest.password = self.passwordTextField.text;

    [remoteClient getUserAccount:loginRequest withDelegate:self];

}

- (void)onGetUserAccountSuccess:(LoginResponse *)response {
    [self.updateMenuDelegate updateMenu:response.userHonor];
    [self loginSuccessAlert];
}

- (void)loginSuccessAlert {
    UIAlertView *alertView = [UIAlertView alertWithTitle:@"Sukces logowania" message:@"Logowanie zakończyło się sukcesem!"];
    __weak LoginViewController *weakSelf = self;
    [alertView addButtonWithTitle:@"OK" handler:^{
        [weakSelf showCenterScreen];
    }];

    [alertView show];
}

- (void)showCenterScreen {
    HotelNavigationController *hotelNavigationController = [self.frostedViewController.storyboard instantiateViewControllerWithIdentifier:@"centerController"];
    AboutViewController *aboutViewController = [self.frostedViewController.storyboard instantiateViewControllerWithIdentifier:@"aboutScreen"];
//    hotelNavigationController.viewControllers = @[aboutViewController];
//    self.frostedViewController.contentViewController = hotelNavigationController;
    [self.navigationController pushViewController:aboutViewController animated:YES];

}

- (void)onRemoteClientError:(ErrorResponse *)error {
    UIAlertView *alertView = [UIAlertView alertWithTitle:@"Error" message:error.description];
    [alertView addButtonWithTitle:@"OK"];

    [alertView show];
}


@end
