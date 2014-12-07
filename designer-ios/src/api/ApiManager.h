//
//  ApiManager.m
//  designer-ios
//
//  Created by r on 14-12-7.
//  Copyright (c) 2014年 jINWANR. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ApiManager.h"
#import "AbstractApi.h"
#import "ApiResult.h"

@interface ApiManager:NSObject

//调用api
+(ApiResult*)invoke:(AbstractApi *)api;

@end