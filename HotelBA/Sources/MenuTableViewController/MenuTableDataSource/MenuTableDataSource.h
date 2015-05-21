//
// Created by Agnieszka Szczurek on 21.05.15.
// Copyright (c) 2015 AgnieszkaSzczurek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MenuTableDataSource : NSObject <UITableViewDataSource>

- (id)initWithCellIdentifier:(NSString *)aCellIdentifier
            isUserRegistered: (BOOL)isUserLoggedIn;

- (id)itemAtIndexPath:(NSIndexPath *)indexPath;

@property(nonatomic, strong) NSArray *items;

@end