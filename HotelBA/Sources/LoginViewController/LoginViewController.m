//
//  LoginViewController.m
//  HotelBA
//
//  Created by Agnieszka Szczurek on 04.06.2015.
//  Copyright (c) 2015 AgnieszkaSzczurek. All rights reserved.
//

#import <REFrostedViewController/UIViewController+REFrostedViewController.h>
#import <REFrostedViewController/REFrostedViewController.h>
#import "LoginViewController.h"
#import "LoginRequest.h"
#import "ErrorResponse.h"
#import "RemoteClient.h"
#import "RemoteClient+Login.h"

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
        NSLog(response.userAccount);
}

- (void)onRemoteClientError:(ErrorResponse *)error {

}


@end
