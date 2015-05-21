//
// Created by Agnieszka Szczurek on 21.05.15.
// Copyright (c) 2015 AgnieszkaSzczurek. All rights reserved.
//

#import "MenuOptionModel.h"


@implementation MenuOptionModel

- (id) initWithType:(MenuType)type title:(NSString *)title image:(NSString *)image {

    self = [super init];
    if(self) {
        self.type = type;
        self.title = title;
        self.modelImage = image;
    }
    return self;

}

@end