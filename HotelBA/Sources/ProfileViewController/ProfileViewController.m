//
//  ProfileViewController.m
//  HotelBA
//
//  Created by Agnieszka Szczurek on 21.06.2015.
//  Copyright (c) 2015 AgnieszkaSzczurek. All rights reserved.
//

#import "ProfileViewController.h"
#import "ReservationDTO.h"
#import "RegistrationDTO.h"
#import "AddressDTO.h"
#import "ContactDTO.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:205/255.0 green:201/255.0 blue:194/255.0 alpha:1.0];
    [self bindEvents];
    self.profile = [ProfileSingleton sharedManager].profile;

    [self setupView];
}

- (void)setupView {

    self.name.text = [NSString stringWithFormat:@"Name: %@ %@", self.profile.firstName, self.profile.lastName];
    self.birthDate.text = [NSString stringWithFormat:@"Birth date: %@", [self getBirthdate:self.profile.birthDate]];

    self.address.text = [NSString stringWithFormat:@"%@ %@, %@ %@", self.profile.addressDTO.street, self.profile.addressDTO.houseNumber,
    [self getPostalCode:self.profile.addressDTO.postalCode], self.profile.addressDTO.city];

    self.email.text = [NSString stringWithFormat:@"Email: %@", self.profile.contactDTO.mail];
    self.phone.text =  [NSString stringWithFormat:@"Phone: %@", self.profile.contactDTO.phone];

}

- (NSString *)getPostalCode:(NSString *) postal {

    NSString *firstPart = [postal substringWithRange:NSMakeRange(0, 2)];
    NSString *secondPart = [postal substringWithRange:NSMakeRange(2, 3)];

    return [NSString stringWithFormat:@"%@-%@", firstPart, secondPart];

}
- (NSString *)getBirthdate:(NSString *)date {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"DD-MM-yyyy"];

    NSTimeInterval timeInterval = [date doubleValue];
    NSDate *d = [NSDate dateWithTimeIntervalSince1970:timeInterval];

    return [formatter stringFromDate:d];
}


- (void)bindEvents {
    [super bindEvents];
}

@end







@implementation ProfileSingleton {
}

+ (instancetype) sharedManager {
    static ProfileSingleton *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [self new];
    });
    return sharedMyManager;
}

- (id)init {
    self = [super init];
    if (self) {
        self.profile = [[RegistrationDTO alloc] init];
    }
    return self;
    }


@end
