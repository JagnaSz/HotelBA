//
// Created by Agnieszka Szczurek on 19.06.15.
// Copyright (c) 2015 AgnieszkaSzczurek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"

@class HotelDTO;

@interface HotelDetailViewController : UIViewController
@property (nonatomic, strong) HotelDTO *hotelDTO;
@end