//
//  RegisterViewController.m
//  HotelBA
//
//  Created by Agnieszka Szczurek on 22.05.2015.
//  Copyright (c) 2015 AgnieszkaSzczurek. All rights reserved.
//

#import "RegisterViewController.h"
#import "ErrorResponse.h"
#import "RemoteClient.h"
#import "RemoteClient+Registration.h"
#import "RegistrationDTO.h"
#import "AddressDTO.h"
#import "ContactDTO.h"
#import <REFrostedViewController/REFrostedViewController.h>

@interface RegisterViewController ()
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *confirmPasswordTextField;
@property (weak, nonatomic) IBOutlet UIButton *registerButton;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:205/255.0 green:201/255.0 blue:194/255.0 alpha:1.0];
    [self bindEvents];
}

- (void)bindEvents {
    [self.registerButton addTarget:self action:@selector(onRegisterButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)onRegisterButtonPressed:(id)onRegisterButtonPressed {

    RemoteClient *remoteClient = [[RemoteClient alloc] init];

    RegistrationRequest *request = [[RegistrationRequest alloc] init];

    AddressDTO *addressDTO = [[AddressDTO alloc] init];
    addressDTO.street = @"Mozarta";
    addressDTO.houseNumber = @"31";
    addressDTO.flatNumber = @"1";
    addressDTO.postalCode = @"31232";
    addressDTO.city = @"Kraków";
    addressDTO.country = @"Poland";
    addressDTO.state = @"małopolskie";

    ContactDTO *contactDTO = [[ContactDTO alloc] init];
    contactDTO.phone = @"111222333";
    contactDTO.mail = @"aga@gmail.com";
    contactDTO.faxPermission = @"true";
    contactDTO.smsPermission = @"true";
    contactDTO.mailPermission = @"true";

    RegistrationDTO *registrationDTO = [[RegistrationDTO alloc] init];
    registrationDTO.firstName = @"Agnieszka";
    registrationDTO.lastName = @"Szczurek";
    registrationDTO.password = @"aga";
    registrationDTO.birthDate = @"123456789";
    registrationDTO.addressDTO = addressDTO;
    registrationDTO.contactDTO = contactDTO;
    registrationDTO.regulaminAccepted = @"true";

    request.registrationDTO = registrationDTO;
    [remoteClient sendRegistration:request withDelegate:self];
}

- (void)onSendPhotoReportSuccess:(NSString *)response {

    NSLog(response);
}

- (void)onRemoteClientError:(ErrorResponse *)error {
    NSLog(@"Error");

}

@end
