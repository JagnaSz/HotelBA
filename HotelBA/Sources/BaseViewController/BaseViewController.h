//
//  BaseViewController.h
//  HotelBA
//
//  Created by Agnieszka Szczurek on 04.06.2015.
//  Copyright (c) 2015 AgnieszkaSzczurek. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *menuButton;

- (void)bindEvents;

- (void)setupMenuButton;
@end
