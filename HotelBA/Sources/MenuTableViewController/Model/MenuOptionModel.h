//
// Created by Agnieszka Szczurek on 21.05.15.
// Copyright (c) 2015 AgnieszkaSzczurek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MenuTableViewController.h"


@interface MenuOptionModel : NSObject

@property (nonatomic) MenuType type;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *modelImage;
-(id) initWithType: (MenuType) type title: (NSString *) title image: (NSString *) image;

@end