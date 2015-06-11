//
//  MenuTableViewController.h
//  HotelBA
//
//  Created by Agnieszka Szczurek on 21.05.2015.
//  Copyright (c) 2015 AgnieszkaSzczurek. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MenuOptionModel;
@class REFrostedViewController;

typedef NS_ENUM(NSInteger, MenuType) {
    MenuTypeLogin,
    MenuTypeAccount,
    MenuTypeReservations,
    MenuTypeAbout
};

@protocol UpdateMenuTableViewProtocol
- (void)updateMenu:(NSString *)userName;;
@end;

@protocol MenuOptionsProtocol
-(void) didSelectOptionWithModel:(MenuOptionModel *) model;
@end;

@interface MenuTableViewController : UITableViewController <UpdateMenuTableViewProtocol>

@property(nonatomic) BOOL isUserLoggedin;

@property(nonatomic, copy) NSString *userName;
@end
