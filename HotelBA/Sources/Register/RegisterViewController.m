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
#import "UIAlertView+GRKAlertBlocks.h"
#import "LoginViewController.h"
#import "AJWValidator.h"

@interface RegisterViewController ()
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *confirmPasswordTextField;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *cityTextField;
@property (weak, nonatomic) IBOutlet UITextField *streetTextField;
@property (weak, nonatomic) IBOutlet UITextField *houseNumberTextField;
@property (weak, nonatomic) IBOutlet UITextField *postalCodeTextField;

@property (weak, nonatomic) IBOutlet UITextField *countryTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *birthTextField;


@property (strong, nonatomic) RegistrationDTO *registrationDTO;
@property (strong, nonatomic) AddressDTO *addressDTO;
@property (strong, nonatomic) ContactDTO *contactDTO;

@property (weak, nonatomic) IBOutlet UIButton *registerButton;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:205/255.0 green:201/255.0 blue:194/255.0 alpha:1.0];
    [self bindEvents];

    self.registrationDTO = [[RegistrationDTO alloc] init];
    self.addressDTO = [[AddressDTO alloc] init];
    self.contactDTO = [[ContactDTO alloc] init];
}

- (void)bindEvents {
    [self.registerButton addTarget:self action:@selector(onRegisterButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)onRegisterButtonPressed:(id)onRegisterButtonPressed {

    BOOL validationSuccess = [self validateAllFields];

    if(validationSuccess) {
        RemoteClient *remoteClient = [[RemoteClient alloc] init];
        RegistrationRequest *request = [[RegistrationRequest alloc] init];

        self.addressDTO.street = self.streetTextField.text;
        self.addressDTO.houseNumber = [self getHouseNumber];
        self.addressDTO.flatNumber = [self getFlatNumber];
        self.addressDTO.postalCode = [self getPostalCode];
        self.addressDTO.city = self.cityTextField.text;
        self.addressDTO.country = self.countryTextField.text;
        self.addressDTO.state = @"malopolska";

        self.contactDTO.phone = self.phoneTextField.text;
        self.contactDTO.mail = self.emailTextField.text;
        self.contactDTO.faxPermission = @"true";
        self.contactDTO.smsPermission = @"true";
        self.contactDTO.mailPermission = @"true";


        self.registrationDTO.firstName = self.nameTextField.text;
        self.registrationDTO.lastName = self.lastNameTextField.text;
        self.registrationDTO.password = self.passwordTextField.text;
        self.registrationDTO.birthDate = [self getBirthDate];
        self.registrationDTO.addressDTO = self.addressDTO;
        self.registrationDTO.contactDTO = self.contactDTO;
        self.registrationDTO.regulaminAccepted = @"true";

        request.registrationDTO = self.registrationDTO;
        [remoteClient sendRegistration:request withDelegate:self];

    }

}

- (NSString *)getBirthDate {

    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setLocale:[NSLocale localeWithLocaleIdentifier:@""]];
    [formatter setDateFormat:@"dd/MM/rrrr"];

    NSDate *date = [formatter dateFromString:self.birthTextField.text];

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"rrrr-MM-dd"];

    return [dateFormatter stringFromDate:date];

}

- (NSString *)getPostalCode {

    NSArray *post = [self.postalCodeTextField.text componentsSeparatedByString:@"-"];
    NSString *postal = [NSString stringWithFormat:@"%@%@", post[0], post[1]];

    return postal;
}

- (NSString *)getFlatNumber {
    NSString *flat;
    if([self.houseNumberTextField.text containsString:@"/"]) {
        flat = [self.houseNumberTextField.text componentsSeparatedByString:@"/"][1];
    }
    else
        flat = @"";

    return flat;
}

- (NSString *)getHouseNumber {

    NSString *house;
    if([self.houseNumberTextField.text containsString:@"/"]) {
        house = [self.houseNumberTextField.text componentsSeparatedByString:@"/"][0];
    }
    else
        house = self.houseNumberTextField.text;

    return house;

}

- (BOOL)validateAllFields {

    BOOL emailSuccess = [self validateEmailTextField];
    BOOL passwordSuccess = [self validatePasswordTextField];
    BOOL confirmPasswordSuccess = [self validateConfirmPasswordTextField];
    BOOL postalCodeSuccess = [self validatePostalCodeTextField];
    BOOL birthdaySuccess = [self validateBirthdayTextField];
    BOOL phoneSuccess = [self validatePhoneTextField];

    return emailSuccess&&passwordSuccess&&confirmPasswordSuccess&&postalCodeSuccess&&birthdaySuccess&&phoneSuccess;

}

- (BOOL)validatePhoneTextField {
    AJWValidator *validator = [AJWValidator validatorWithType:AJWValidatorTypeString];
    [validator addValidationToEnsureRegularExpressionIsMetWithPattern:@"[0-9]{9}" invalidMessage:@"Error"];
    [validator validate:self.phoneTextField.text];

    if(validator.state == AJWValidatorValidationStateInvalid) {
        [self showValidationAlertWithTitle:@"Bad phone number" message:@"Phone number should be of format \"777666555\""];
        return NO;
    }
    else
        return YES;

}

- (BOOL)validateBirthdayTextField {
    AJWValidator *validator = [AJWValidator validatorWithType:AJWValidatorTypeString];
    [validator addValidationToEnsureRegularExpressionIsMetWithPattern:@"^(?:(?:31(\\/|-|\\.)(?:0?[13578]|1[02]))\\1|(?:(?:29|30)(\\/|-|\\.)(?:0?[1,3-9]|1[0-2])\\2))(?:(?:1[6-9]|[2-9]\\d)?\\d{2})$|^(?:29(\\/|-|\\.)0?2\\3(?:(?:(?:1[6-9]|[2-9]\\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\\d|2[0-8])(\\/|-|\\.)(?:(?:0?[1-9])|(?:1[0-2]))\\4(?:(?:1[6-9]|[2-9]\\d)?\\d{2})$" invalidMessage:@"Error"];
    [validator validate:self.birthTextField.text];

    if(validator.state == AJWValidatorValidationStateInvalid) {
        [self showValidationAlertWithTitle:@"Bad birth date" message:@"Birth date should be of format \"01/02/1993\""];
        return NO;
    }
    else
        return YES;

}

- (BOOL)validatePostalCodeTextField {
    AJWValidator *validator = [AJWValidator validatorWithType:AJWValidatorTypeString];
    [validator addValidationToEnsureRegularExpressionIsMetWithPattern:@"[0-9]{2}-[0-9]{3}" invalidMessage:@"Error"];
    [validator validate:self.postalCodeTextField.text];

    if(validator.state == AJWValidatorValidationStateInvalid) {
        [self showValidationAlertWithTitle:@"Bad post code" message:@"Post code should be of format \"33-232\""];
        return NO;
    }
    else
        return YES;

}

- (BOOL)validateConfirmPasswordTextField {

    AJWValidator *validator = [AJWValidator validatorWithType:AJWValidatorTypeString];
    [validator addValidationToEnsureInstanceIsTheSameAs: self.passwordTextField.text invalidMessage: @"Not the same"];
    [validator validate:self.confirmPasswordTextField.text];

    if(validator.state == AJWValidatorValidationStateInvalid) {
        [self showValidationAlertWithTitle:@"Passwords are not the same" message:@"Repeat password again"];
        return NO;
    }
    else
        return YES;
}

- (BOOL)validatePasswordTextField {

    AJWValidator *validator = [AJWValidator validatorWithType:AJWValidatorTypeString];
    [validator addValidationToEnsureMinimumLength:8 invalidMessage:@"Must be min 8 characters"];
    [validator validate: self.passwordTextField.text];

    if(validator.state == AJWValidatorValidationStateInvalid) {
        [self showValidationAlertWithTitle:@"Bad password" message:@"Password should haves min 8 characters"];
        return NO;
    }
    else
        return YES;

}

- (BOOL)validateEmailTextField {
    AJWValidator *validator = [AJWValidator validatorWithType:AJWValidatorTypeString];
    [validator addValidationToEnsureValidEmailWithInvalidMessage: @"Must be a valid email address"];
    [validator validate:self.emailTextField.text];

    if(validator.state == AJWValidatorValidationStateInvalid) {
        [self showValidationAlertWithTitle:@"Invalid e-mail" message:@"Please type correct password"];
        return NO;
    }
    else
        return YES;

}

- (void) showValidationAlertWithTitle:(NSString *) title message:(NSString*) message {
    UIAlertView *alertView = [UIAlertView alertWithTitle:title message:message];
    [alertView addButtonWithTitle:@"OK"];
    [alertView show];
}

- (void)onRegistrationSuccess:(NSString *)response {
    
    UIAlertView *alertView = [UIAlertView alertWithTitle:@"Registration success!" message: @"Registration has ended with success"];
    __weak RegisterViewController *weakSelf = self;
    [alertView addButtonWithTitle:@"OK" handler: ^{
        [weakSelf.navigationController popViewControllerAnimated:YES];
    }];

    [alertView show];
}


- (void)onRemoteClientError:(ErrorResponse *)error {
    UIAlertView *alertView = [UIAlertView alertWithTitle:@"Error" message:error.error.userInfo[@"NSLocalizedDescription"]];
    [alertView addButtonWithTitle:@"OK"];

}

@end
