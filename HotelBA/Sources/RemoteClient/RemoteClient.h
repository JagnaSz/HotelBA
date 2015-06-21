//
// Created by Agnieszka Szczurek on 04.06.15.
// Copyright (c) 2015 AgnieszkaSzczurek. All rights reserved.
//

#import <Foundation/Foundation.h>
@class AFHTTPRequestOperationManager;
@protocol RemoteClientDelegate;

static NSString *const apiAddressString = @"http://soahotelcore-hotelcore.rhcloud.com/core-0.1/";

@interface RemoteClient : NSObject

@property(nonatomic, strong) AFHTTPRequestOperationManager *httpClient;

+ (RemoteClient *)instance;

- (void)deletePath:(NSString *)path params:(NSDictionary *)params success:(void (^)(NSDictionary *response))successBlock andDelegate:(id <RemoteClientDelegate>)delegate;

- (void)postPath:(NSString *)path params:(NSDictionary *)params success:(void (^)(NSDictionary *))successBlock andDelegate:(id <RemoteClientDelegate>)delegate;

- (void)postPath:(NSString *)path params:(NSDictionary *)params successWithJSON:(void (^)(NSDictionary *response))successBlock andDelegate:(id <RemoteClientDelegate>)delegate;

- (void)getPath:(NSString *)path params:(NSDictionary *)params success:(void (^)(NSDictionary *response))successBlock andDelegate:(id <RemoteClientDelegate>)delegate;

@end