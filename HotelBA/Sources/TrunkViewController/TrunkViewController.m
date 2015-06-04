//
//  TrunkViewController.m
//  HotelBA
//
//  Created by Agnieszka Szczurek on 22.05.2015.
//  Copyright (c) 2015 AgnieszkaSzczurek. All rights reserved.
//

#import "TrunkViewController.h"
#import "RegisterViewController.h"
#import "LoginViewController.h"

@interface TrunkViewController ()
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *registerButton;

@end

@implementation TrunkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupButtons];
    [self bindEvents];
}


- (void)bindEvents {
    [super bindEvents];
    [self.registerButton addTarget:self action:@selector(eventRegisterButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.loginButton addTarget:self action:@selector(eventLoginButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)eventLoginButtonPressed:(id)eventLoginButtonPressed {

    LoginViewController *loginViewController = [[LoginViewController alloc] init];
    [self.navigationController pushViewController:loginViewController animated:YES];

}

- (void)eventRegisterButtonPressed:(id)eventRegisterButtonPressed {

    RegisterViewController *registerViewController = [[RegisterViewController alloc] init];
    [self.navigationController pushViewController:registerViewController animated:YES];

}

- (void)setupButtons {
    [self.loginButton setBackgroundColor:[UIColor whiteColor]];
    [self.registerButton setBackgroundColor:[UIColor whiteColor]];

    self.loginButton.layer.cornerRadius = 10.f;
    self.loginButton.layer.borderWidth = 2.f;
    self.loginButton.layer.borderColor = [UIColor blackColor].CGColor;

    self.registerButton.layer.cornerRadius = 10.f;
    self.registerButton.layer.borderWidth = 2.f;
    self.registerButton.layer.borderColor = [UIColor blackColor].CGColor;
}


@end
