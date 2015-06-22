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
#import "ReservationDTO.h"
#import "RegistrationDTO.h"
#import "ErrorResponse.h"
#import "RemoteClient.h"
#import "RemoteClient+Login.h"
#import "MenuTableViewController.h"
#import "UIAlertView+GRKAlertBlocks.h"
#import "CenterViewController.h"
#import "HotelNavigationController.h"
#import "AboutViewController.h"
#import "AccountTokenSingleton.h"
#import "ReservationDTO.h"
#import "ProfileViewController.h"
#import "RegistrationDTO.h"

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
    [AccountTokenSingleton sharedManager].token = response.token;
    [self.updateMenuDelegate updateMenu:response.userHonor];
    self.userAccount = [RegistrationDTO createAccountWithDicitonary:response.userAccount[@"account"]];
    [self loginSuccessAlert];
}

- (void)loginSuccessAlert {
    UIAlertView *alertView = [UIAlertView alertWithTitle:@"Log in success" message:@"Log in was finished with success!"];
    __weak LoginViewController *weakSelf = self;
    [alertView addButtonWithTitle:@"OK" handler:^{
        [weakSelf showCenterScreen];
    }];

    [alertView show];
}

- (void)showCenterScreen {
    ProfileViewController *profileViewController = [self.frostedViewController.storyboard instantiateViewControllerWithIdentifier:@"profile"];
    [ProfileSingleton sharedManager].profile = self.userAccount;
    [self.navigationController pushViewController:profileViewController animated:YES];

}

- (void)onRemoteClientError:(ErrorResponse *)error {
    UIAlertView *alertView = [UIAlertView alertWithTitle:@"Error" message:error.error.userInfo[@"NSLocalizedDescription"]];
    [alertView addButtonWithTitle:@"OK"];

    [alertView show];
}


@end
