//
//  LoginViewController.m
//  HotelBA
//
//  Created by Agnieszka Szczurek on 04.06.2015.
//  Copyright (c) 2015 AgnieszkaSzczurek. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:205/255.0 green:201/255.0 blue:194/255.0 alpha:1.0];
}


@end
