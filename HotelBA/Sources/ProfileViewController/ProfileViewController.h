//
//  ProfileViewController.h
//  HotelBA
//
//  Created by Agnieszka Szczurek on 21.06.2015.
//  Copyright (c) 2015 AgnieszkaSzczurek. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@class ReservationDTO;
@class RegistrationDTO;

@interface ProfileViewController : BaseViewController
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *birthDate;
@property (weak, nonatomic) IBOutlet UILabel *address;
@property (weak, nonatomic) IBOutlet UILabel *phone;
@property (weak, nonatomic) IBOutlet UILabel *email;


@property(nonatomic, strong) RegistrationDTO *profile;
@end

@interface ProfileSingleton :NSObject

@property(nonatomic, strong) RegistrationDTO *profile;

+ (instancetype)sharedManager;
@end