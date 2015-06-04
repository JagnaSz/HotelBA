//
//  BaseViewController.m
//  HotelBA
//
//  Created by Agnieszka Szczurek on 04.06.2015.
//  Copyright (c) 2015 AgnieszkaSzczurek. All rights reserved.
//

#import "BaseViewController.h"
#import "UIImage+Helper.h"
#import <REFrostedViewController/REFrostedViewController.h>

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self bindEvents];
    [self setupMenuButton];
}

- (void)bindEvents {

    [self.menuButton addTarget:self action:@selector(eventMenuButtonPressed:) forControlEvents: UIControlEventTouchUpInside];

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

- (void)eventMenuButtonPressed:(id)eventMenuButtonPressed {

    [self.view endEditing:YES];
    [self.frostedViewController.view endEditing:YES];

    [self.frostedViewController presentMenuViewController];
}

@end
