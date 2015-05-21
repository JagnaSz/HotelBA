//
//  ProfileHeader.h
//  HotelBA
//
//  Created by Agnieszka Szczurek on 21.05.2015.
//  Copyright (c) 2015 AgnieszkaSzczurek. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileHeader : UITableViewHeaderFooterView

extern NSString *const ProfileHeaderIdentifier;
@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
@property (weak, nonatomic) IBOutlet UILabel *profileHonor;

- (void)setupProfileDataWithImageName:(NSString *)imgName name:(NSString *)name;
@end
