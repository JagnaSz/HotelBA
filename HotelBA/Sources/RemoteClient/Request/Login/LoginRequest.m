//
// Created by Agnieszka Szczurek on 10.06.15.
// Copyright (c) 2015 AgnieszkaSzczurek. All rights reserved.
//

#import "LoginRequest.h"


@implementation LoginRequest {

}
@end

@implementation LoginResponse {

}
- (NSString *)userHonor {
    return [NSString stringWithFormat:@"%@ %@", [self.userAccount[@"account"] objectForKey:@"firstName"], [self.userAccount[@"account"] objectForKey:@"lastName"]];
}

- (NSString *) token {
    return self.userAccount[@"token"];
}
@end