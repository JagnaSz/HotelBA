//
//  MenuTableViewCell.m
//  HotelBA
//
//  Created by Agnieszka Szczurek on 21.05.2015.
//  Copyright (c) 2015 AgnieszkaSzczurek. All rights reserved.
//

#import "MenuTableViewCell.h"
#import "MenuOptionModel.h"
#import "UIImage+Helper.h"

@implementation MenuTableViewCell

NSString* const MenuTableViewCellIdentifier = @"MenuCellIdentifier";

- (void)awakeFromNib {
    [super awakeFromNib];

    self.backgroundColor = [UIColor clearColor];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)updateCellWithModel:(MenuOptionModel *)model {

    self.title.text = model.title;
    self.menuImage.image = [UIImage imageNamed:model.modelImage];
    self.menuImage.image = [self.menuImage.image imageByFilledWithColor:[UIColor blackColor]];

}


+ (UINib *)nib {
    return [UINib nibWithNibName:@"MenuTableViewCell" bundle:nil];
}
@end
