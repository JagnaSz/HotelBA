//
// Created by Agnieszka Szczurek on 21.05.15.
// Copyright (c) 2015 AgnieszkaSzczurek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol MenuOptionsProtocol;
@class ProfileHeader;


@interface MenuTableViewDelegate : NSObject <UITableViewDelegate>

@property (nonatomic, weak) id<MenuOptionsProtocol> optionsDelegate;
@property (nonatomic, strong)  ProfileHeader* header;
@property(nonatomic, strong) NSString *userHonor;

- (id)initWithItems:(NSArray *)anItems userName:(NSString *) name;
@end