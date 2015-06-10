//
// Created by Agnieszka Szczurek on 04.06.15.
// Copyright (c) 2015 AgnieszkaSzczurek. All rights reserved.
//

#import "RemoteClient.h"
#import"AFHTTPRequestOperationManager.h"
#import "ErrorResponse.h"
#import "RemoteClientDelegate.h"


@interface RemoteClient () {
    NSDictionary *dict;
}
@end


@implementation RemoteClient

+ (RemoteClient *)instance {
    static RemoteClient *_instance = nil;

    @synchronized (self) {
        if (_instance == nil) {
            _instance = [[self alloc] init];

        }
    }

    return _instance;
}

- (id)init {

    self = [super init];

    if (self) {

        NSString *pathURLString = [NSString stringWithFormat:apiAddressString];
        self.httpClient = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:pathURLString]];
       // self.httpClient.requestSerializer = [AFHTTPRequestSerializer serializer];
        AFJSONRequestSerializer *requestSerializer = [AFJSONRequestSerializer serializer];
        [requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        self.httpClient.requestSerializer = requestSerializer;
       // self.httpClient.responseSerializer = [AFHTTPResponseSerializer serializer];
        [self.httpClient.responseSerializer setAcceptableContentTypes:[ NSSet setWithObject:@"application/json"]];
    }

    return self;

}

- (void)postPath:(NSString *)path  params:(NSDictionary *)params success:(void (^)(NSDictionary *response))successBlock   andDelegate:(id <RemoteClientDelegate>)delegate {

    [self.httpClient POST:path parameters:params success:^void(AFHTTPRequestOperation *operation, id result) {


                      NSData *const data = result;

                     // if (data != nil) {
                       //   NSError *parsingError;
                         // dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&parsingError];

                          if (result != nil) {

                              successBlock(result);

                          } else {
                              ErrorResponse *response;
                              response = [ErrorResponse responseWithError:nil];
                              [delegate onRemoteClientError:response];

                          }
                     // }
                  }
                  failure:^void(AFHTTPRequestOperation *operation, NSError *error) {

                      ErrorResponse *response = [ErrorResponse responseWithError:error];
                      [delegate onRemoteClientError:response];
                  }];

}

- (void)getPath:(NSString *)path params:(NSDictionary *)params success:(void (^)(NSDictionary *response))successBlock   andDelegate:(id <RemoteClientDelegate>)delegate  {

    [self.httpClient GET:path
              parameters:params
                 success:^void(AFHTTPRequestOperation *operation, id result) {

                     NSData *const data = result;

                     if (data != nil) {

                         NSError *parsingError = nil;
                         dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&parsingError];


                         if (!parsingError) {
                             NSData *JSONData = [NSKeyedArchiver archivedDataWithRootObject:dict];
                             [[NSUserDefaults standardUserDefaults] setObject:JSONData forKey:@"JSONData"];
                             successBlock(dict);


                         } else {

                             ErrorResponse *response;
                             response = [ErrorResponse responseWithError:parsingError];
                             [delegate onRemoteClientError:response];
                         }
                     }
                 }
                 failure:^void(AFHTTPRequestOperation *operation, NSError *error) {

                              ErrorResponse *response;
                              response = [ErrorResponse responseWithError:error];
                              [delegate onRemoteClientError:response];
                 }];
}

@end