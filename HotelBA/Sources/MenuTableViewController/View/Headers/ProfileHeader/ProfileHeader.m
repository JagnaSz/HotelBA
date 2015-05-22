//
//  ProfileHeader.m
//  HotelBA
//
//  Created by Agnieszka Szczurek on 21.05.2015.
//  Copyright (c) 2015 AgnieszkaSzczurek. All rights reserved.
//

#import "ProfileHeader.h"

@implementation ProfileHeader

NSString *const ProfileHeaderIdentifier = @"profileHeader";

- (void)awakeFromNib {
    [super awakeFromNib];
    self.contentView.backgroundColor = [UIColor clearColor];

    [self setupView];
}


- (void)setupProfileDataWithImageName:(NSString *)imgName  name:(NSString *)name {

    self.profileImage.image = [UIImage imageNamed:imgName];
    self.profileHonor.text = name;

}
- (void)setupView {

    self.profileImage.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    self.profileImage.layer.masksToBounds = YES;
    self.profileImage.layer.cornerRadius = 50.0;
    self.profileImage.layer.borderColor = [UIColor whiteColor].CGColor;
    self.profileImage.layer.borderWidth = 3.0f;
    self.profileImage.layer.rasterizationScale = [UIScreen mainScreen].scale;
    self.profileImage.layer.shouldRasterize = YES;
    self.profileImage.clipsToBounds = YES;

}

@end
