//
//  TrunkViewController.m
//  HotelBA
//
//  Created by Agnieszka Szczurek on 22.05.2015.
//  Copyright (c) 2015 AgnieszkaSzczurek. All rights reserved.
//

#import "TrunkViewController.h"
#import "UIImage+Helper.h"
#import "RegisterViewController.h"
#import "LoginViewController.h"
#import <REFrostedViewController/REFrostedViewController.h>

@interface TrunkViewController ()
@property (weak, nonatomic) IBOutlet UIButton *menuButton;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *registerButton;

@end

@implementation TrunkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupMenuButton];
    [self setupButtons];
    [self setupBindEvents];
}


- (void)setupBindEvents {

    [self.menuButton addTarget:self action:@selector(eventMenuButtonPressed:) forControlEvents: UIControlEventTouchUpInside];
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

- (void)eventMenuButtonPressed:(id)eventMenuButtonPressed {

    [self.view endEditing:YES];
    [self.frostedViewController.view endEditing:YES];

    [self.frostedViewController presentMenuViewController];
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
