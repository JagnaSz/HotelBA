//
//  TrunkViewController.m
//  HotelBA
//
//  Created by Agnieszka Szczurek on 22.05.2015.
//  Copyright (c) 2015 AgnieszkaSzczurek. All rights reserved.
//

#import "TrunkViewController.h"
#import "UIImage+Helper.h"
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
}


@end
