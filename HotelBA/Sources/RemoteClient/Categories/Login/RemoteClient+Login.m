//
// Created by Agnieszka Szczurek on 10.06.15.
// Copyright (c) 2015 AgnieszkaSzczurek. All rights reserved.
//

#import "RemoteClient+Login.h"
#import "LoginRequest.h"
#import "ErrorResponse.h"


@implementation RemoteClient (Login)

- (void)getUserAccount:(LoginRequest *)request withDelegate:(id <GetUserAccountDelegate>)delegate {
    NSString *path = [NSString stringWithFormat:@"login/in/%@/%@",request.email,request.password];

    [self postPath:path
           params:nil
          success:^void(NSDictionary *responseDictionary) {
              if (responseDictionary != nil) {
                    LoginResponse *loginResponse = [[LoginResponse alloc] init];
                  loginResponse.userAccount = responseDictionary;
                  [delegate onGetUserAccountSuccess:loginResponse];

              } else {
//                    ErrorResponse *response = [ErrorResponse objectForDictionary:responseDictionary];
                  ErrorResponse *response = [[ErrorResponse alloc] initWithError:nil];
                  [delegate onRemoteClientError:response];
              }

          } andDelegate:delegate
    ];

}
@end