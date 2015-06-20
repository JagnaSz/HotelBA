//
// Created by Agnieszka Szczurek on 19.06.15.
// Copyright (c) 2015 AgnieszkaSzczurek. All rights reserved.
//

#import "HotelDetailViewController.h"
#import "HotelDTO.h"
#import "AddressDTO.h"
#import "ContactDTO.h"
#import "HotelReservationsViewController.h"

@interface HotelDetailViewController()
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *hotelDesc;
@property (weak, nonatomic) IBOutlet UILabel *ratings;
@property (weak, nonatomic) IBOutlet UILabel *street;
@property (weak, nonatomic) IBOutlet UILabel *postalCode;

@property (weak, nonatomic) IBOutlet UILabel *houseNumber;
@property (weak, nonatomic) IBOutlet UILabel *city;
@property (weak, nonatomic) IBOutlet UILabel *state;
@property (weak, nonatomic) IBOutlet UILabel *country;
@property (weak, nonatomic) IBOutlet UILabel *phone;
@property (weak, nonatomic) IBOutlet UILabel *email;
@property (weak, nonatomic) IBOutlet UIButton *reservationButton;


@end

@implementation HotelDetailViewController {

}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:205/255.0 green:201/255.0 blue:194/255.0 alpha:1.0];

    [self setupView];
    [self bindEvents];
}

- (void)bindEvents {
    [self.reservationButton addTarget:self action:@selector(eventReservationButton:) forControlEvents:UIControlEventTouchUpInside];

}

- (void)eventReservationButton:(id)eventReservationButton {

    HotelReservationsViewController *hotelReservationsViewController = [[HotelReservationsViewController alloc] init];
    [self.navigationController pushViewController:hotelReservationsViewController animated:YES];

}

- (void)setupView {
    self.name.text = [NSString stringWithFormat:@"Hotel name :\t %@", self.hotelDTO.hotelName];
    self.hotelDesc.text = [NSString stringWithFormat:@"Hotel description :\t %@", self.hotelDTO.hotelDescription];
    self.ratings.text = [NSString stringWithFormat:@"Average rate :\t"];
    self.street.text = [NSString stringWithFormat:@"Street :\t %@",self.hotelDTO.addressDTO.street];
    self.houseNumber.text = [NSString stringWithFormat:@"House number :\t %@",self.hotelDTO.addressDTO.houseNumber];
    self.postalCode.text = [NSString stringWithFormat:@"Postal code :\t %@",self.hotelDTO.addressDTO.postalCode];
    self.city.text = [NSString stringWithFormat:@"City :\t %@",self.hotelDTO.addressDTO.city];
    self.state.text = [NSString stringWithFormat:@"State :\t %@",self.hotelDTO.addressDTO.state];
    self.country.text = [NSString stringWithFormat:@"Street :\t %@",self.hotelDTO.addressDTO.country];
    self.phone.text = [NSString stringWithFormat:@"Phone number :\t %@",self.hotelDTO.contactDTO.phone];
    self.email.text = [NSString stringWithFormat:@"Email :\t %@",self.hotelDTO.contactDTO.mail];

}

@end