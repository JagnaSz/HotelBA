//
//  HotelsReservationsTableViewCell.m
//  HotelBA
//
//  Created by Agnieszka Szczurek on 20.06.2015.
//  Copyright (c) 2015 AgnieszkaSzczurek. All rights reserved.
//

#import "HotelsReservationsTableViewCell.h"
#import "ReservationDTO.h"
#import "RegistrationDTO.h"
#import "ContactDTO.h"
#import "RoomDTO.h"
#import "RoomTypeDTO.h"
#import "HotelReservationsViewController.h"
#import "NewComplaintViewController.h"

@interface HotelsReservationsTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *reservationId;
@property (weak, nonatomic) IBOutlet UILabel *reservationDate;
@property (weak, nonatomic) IBOutlet UILabel *clientHonor;
@property (weak, nonatomic) IBOutlet UILabel *email;
@property (weak, nonatomic) IBOutlet UILabel *room;
@property (weak, nonatomic) IBOutlet UILabel *roomDesc;
@property (weak, nonatomic) IBOutlet UILabel *roomOptions;
@property (weak, nonatomic) IBOutlet UIButton *complaintsButton;
@property (nonatomic, strong) NSString *resId;
@end

@implementation HotelsReservationsTableViewCell

- (void)awakeFromNib {
    [self bindEvents];
}

- (void)bindEvents {
    [self.complaintsButton addTarget:self action:@selector(onComplaintButtonPressed:) forControlEvents:UIControlEventTouchUpInside];

}

- (void)onComplaintButtonPressed:(id)onComplaintButtonPressed {
    NewComplaintViewController *complaintsViewController = [[NewComplaintViewController alloc] init];
    complaintsViewController.reservationId = self.resId;
    complaintsViewController.email = self.emailText;
    [self.cellDelegate pushComplaintViewController:complaintsViewController];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

- (void)setupView:(ReservationDTO *)reservation {
    self.resId = [NSString stringWithFormat:@"%@", @(reservation.reservationID)];
    self.emailText = reservation.registrationDTO.contactDTO.mail;
    self.reservationId.text = [NSString stringWithFormat: @"id: %d",reservation.reservationID];
    self.reservationDate.text = [NSString stringWithFormat:@"From: %@ to %@", [self createDateFromString:reservation.startDate], [self createDateFromString:reservation.endDate]];
    self.clientHonor.text = [NSString stringWithFormat:@"Client honor: %@ %@", reservation.registrationDTO.firstName,reservation.registrationDTO.lastName];
    self.email.text = [NSString stringWithFormat:@"Email: %@",reservation.registrationDTO.contactDTO.mail];
    self.room.text = [NSString stringWithFormat:@"Room name: %@",reservation.roomDTO.roomTypeDTO.roomTypeName];
    self.roomDesc.text =[NSString stringWithFormat:@"Room description: %@",reservation.roomDTO.roomTypeDTO.roomTypeDescription];
    self.roomOptions.text = [NSString stringWithFormat:@"Room no.: %d, size: %d, floor: %d",reservation.roomDTO.number, reservation.roomDTO.roomSize, reservation.roomDTO.floor];

}

- (NSString *) createDateFromString:(NSString *) date {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd-MM-yyyy"];

    NSTimeInterval timeInterval = [date doubleValue]/1000;
    NSDate *d = [NSDate dateWithTimeIntervalSince1970:timeInterval];

    return [formatter stringFromDate:d];
}
@end
