//
//  NewComplaintViewController.h
//  HotelBA
//
//  Created by Agnieszka Szczurek on 21.06.2015.
//  Copyright (c) 2015 AgnieszkaSzczurek. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ComplaintRequest.h"

@interface NewComplaintViewController : UIViewController <GetComplaintDelegate>

@property (nonatomic, strong) NSString *reservationId;
@property (nonatomic, strong) NSString *email;

@end
