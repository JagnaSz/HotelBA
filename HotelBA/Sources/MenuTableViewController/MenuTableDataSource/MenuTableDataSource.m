//
// Created by Agnieszka Szczurek on 21.05.15.
// Copyright (c) 2015 AgnieszkaSzczurek. All rights reserved.
//

#import "MenuTableDataSource.h"
#import "MenuTableViewCell.h"
#import "MenuOptionModel.h"


@interface MenuTableDataSource ()

@property(nonatomic, copy) NSString *cellIdentifier;

@end

@implementation MenuTableDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MenuTableViewCell *menuTableViewCell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier forIndexPath:indexPath];
    id item = [self itemAtIndexPath:indexPath];
    [menuTableViewCell updateCellWithModel:item];
    return menuTableViewCell;
}


- (id)initWithCellIdentifier:(NSString *)aCellIdentifier isUserRegistered:(BOOL)isUserLoggedIn {
    self = [super init];
    if (self) {

        self.items = [self setupMenuItems:isUserLoggedIn];
        self.cellIdentifier = aCellIdentifier;
    }

    return self;
}

- (NSArray *)setupMenuItems:(BOOL)isUserRegistered {

    MenuOptionModel *info = [[MenuOptionModel alloc] initWithType:MenuTypeAbout title:@"About" image:@"info"];

    NSMutableArray *menuArray;

    if(isUserRegistered) {
        menuArray = [NSMutableArray arrayWithArray:@[
                [[MenuOptionModel alloc] initWithType:MenuTypeAccount title:@"Profile" image:@"account"],
                [[MenuOptionModel alloc] initWithType:MenuTypeHotels title:@"Hotels" image:@"reservations"],
        ]];
    }
    else
        menuArray = [NSMutableArray arrayWithArray:@[
                [[MenuOptionModel alloc] initWithType:MenuTypeLogin title:@"Log in" image:@"login"]
        ]];

    [menuArray insertObject:info atIndex:menuArray.count];

    if(isUserRegistered)
        [menuArray insertObject:[[MenuOptionModel alloc] initWithType:MenuTypeLogout title:@"Logout" image:@"logout"] atIndex:menuArray.count];
    return menuArray;


}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath {

    return self.items[(NSUInteger) indexPath.row];

}

@end