//
//  MenuTableViewCell.h
//  HotelBA
//
//  Created by Agnieszka Szczurek on 21.05.2015.
//  Copyright (c) 2015 AgnieszkaSzczurek. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MenuOptionModel;

@interface MenuTableViewCell : UITableViewCell

extern NSString* const MenuTableViewCellIdentifier;
@property (weak, nonatomic) IBOutlet UIImageView *menuImage;
@property (weak, nonatomic) IBOutlet UILabel *title;

- (void)updateCellWithModel:(MenuOptionModel *)model;

+ (UINib *)nib;
@end
