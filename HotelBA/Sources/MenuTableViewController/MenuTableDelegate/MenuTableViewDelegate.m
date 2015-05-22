//
// Created by Agnieszka Szczurek on 21.05.15.
// Copyright (c) 2015 AgnieszkaSzczurek. All rights reserved.
//

#import "MenuTableViewDelegate.h"
#import "ProfileHeader.h"
#import "MenuTableViewController.h"

@interface MenuTableViewDelegate()

@property (nonatomic, strong) NSArray * items;

@end

@implementation MenuTableViewDelegate

- (id)initWithItems:(NSArray *)anItems {
    self = [super init];
    if (self) {
        self.items = anItems;
    }

    return self;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {

    ProfileHeader* header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ProfileHeaderIdentifier];
    [header setupProfileDataWithImageName:@"user_placeholder" name:@"Employee"];
    return header;

}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 200;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    MenuOptionModel *model = self.items[(NSUInteger) indexPath.row];
    [self.optionsDelegate didSelectOptionWithModel:model];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end