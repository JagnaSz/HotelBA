//
//  LoginViewController.h
//  HotelBA
//
//  Created by Agnieszka Szczurek on 04.06.2015.
//  Copyright (c) 2015 AgnieszkaSzczurek. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UpdateMenuTableViewProtocol;
@class ReservationDTO;
@class RegistrationDTO;

@interface LoginViewController : UIViewController

@property (nonatomic, weak) id<UpdateMenuTableViewProtocol> updateMenuDelegate;

@property(nonatomic, strong) RegistrationDTO *userAccount;

- (void)showCenterScreen;
@end
