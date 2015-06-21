//
//  NewComplaintViewController.m
//  HotelBA
//
//  Created by Agnieszka Szczurek on 21.06.2015.
//  Copyright (c) 2015 AgnieszkaSzczurek. All rights reserved.
//

#import "NewComplaintViewController.h"
#import "ErrorResponse.h"
#import "RemoteClient.h"
#import "RemoteClient+Complaint.h"
#import "ComplaintDTO.h"
#import "UIAlertView+GRKAlertBlocks.h"
#import <MessageUI/MessageUI.h>

@interface NewComplaintViewController () <MFMailComposeViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UIButton *replyButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *replyButtonHeightConstraint;

@end

@implementation NewComplaintViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:205/255.0 green:201/255.0 blue:194/255.0 alpha:1.0];

    RemoteClient *remoteClient = [[RemoteClient alloc] init];
    ComplaintRequest *complaintRequest = [[ComplaintRequest alloc] init];
    complaintRequest.reservationId = self.reservationId;
    [remoteClient getComplaintWithRequest:complaintRequest withDelegate:self];

    [self bindEvents];
}

- (void)bindEvents {

    [self.replyButton addTarget:self action:@selector(onReplyButtonPress:) forControlEvents:UIControlEventTouchUpInside];

}

- (void)onReplyButtonPress:(id)onReplyButtonPress {
    if ([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController *mail = [[MFMailComposeViewController alloc] init];
        mail.mailComposeDelegate = self;
        [mail setSubject:@"Complaint"];
        [mail setToRecipients:@[self.email]];

        [self presentViewController:mail animated:YES completion:NULL];
    }
    else
    {
        NSLog(@"This device cannot send email");
    }

}

- (void)onGetComplaintSuccess:(ComplaintResponse *)response {
    self.descriptionLabel.text = [NSString stringWithFormat:@"Complaint message: %@", response.complaintDTO.complaintDescription];
}

- (void)onRemoteClientError:(ErrorResponse *)error {

    UIAlertView *alertView = [UIAlertView alertWithTitle:@"Error" message:error.description];
    [alertView addButtonWithTitle:@"OK"];

    [alertView show];

}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    switch (result) {
        case MFMailComposeResultSent:
            NSLog(@"You sent the email.");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"You saved a draft of this email");
            break;
        case MFMailComposeResultCancelled:
            NSLog(@"Email cancelled.");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail failed:  An error occurred when trying to compose this email");
            break;
        default:
            NSLog(@"An error occurred when trying to compose this email");
            break;
    }

    [self dismissViewControllerAnimated:YES completion:NULL];
}


@end
