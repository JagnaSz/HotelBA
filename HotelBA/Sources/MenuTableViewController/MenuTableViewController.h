//
//  MenuTableViewController.h
//  HotelBA
//
//  Created by Agnieszka Szczurek on 21.05.2015.
//  Copyright (c) 2015 AgnieszkaSzczurek. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MenuOptionModel;

typedef NS_ENUM(NSInteger, MenuType) {
    MenuTypeLogin,
    MenuTypeAccount,
    MenuTypeReservations,
    MenuTypeAbout
};

@protocol MenuOptionsProtocol
-(void) didSelectOptionWithModel:(MenuOptionModel *) model;
@end;

@interface MenuTableViewController : UITableViewController

@end
