//
//  CenterViewController.m
//  HotelBA
//
//  Created by Agnieszka Szczurek on 21.05.2015.
//  Copyright (c) 2015 AgnieszkaSzczurek. All rights reserved.
//

#import <REFrostedViewController/REFrostedViewController.h>
#import "CenterViewController.h"
#import "UIImage+Helper.h"

@interface CenterViewController ()
@property (weak, nonatomic) IBOutlet UIButton *menuButton;

@end

@implementation CenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupMenuButton];
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

@end
