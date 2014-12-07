//
//  ApiManager.m
//  designer-ios
//
//  Created by r on 14-12-7.
//  Copyright (c) 2014年 jINWANR. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ApiResult.h"
#import "AbstractApi.h"
#import "ApiManager.h"
#import "MD5Util.h"

#import "AFHTTPRequestOperationManager.h"

@interface ApiManager()

@end

@implementation ApiManager

//调用api
+(ApiResult*)invoke:(AbstractApi *)api{
    
    //检查网络状态
    BOOL networkAvailable = true;
    if(!networkAvailable){//未联网
       
    }
    
    if([api needAuth]){
        //游客的操作检查
    }
    
    NSString *requestUri = [api getRequestUri];
    NSString *response = nil;
    NSDictionary  *apiParamMap = [api getParamMap];
    NSString *method = [api getRequestMethod];
    //构造完整请求参数
    //NSMutableDictionary  *fullParamMap = [self buildFullParam:apiParamMap];
    NSMutableDictionary  *fullParamMap =  [self buildFullParam:apiParamMap];
    
    //判断是否是multipart请求
    bool isMultipart = api.isMultipart;
    if(!isMultipart){
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
        
        
        if([@"post" isEqual:[method lowercaseString]]){
            [manager POST:requestUri parameters:fullParamMap success:^(AFHTTPRequestOperation *operation, id responseObject) {
                NSLog(@"JSON: %@", responseObject);
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                NSLog(@"Error: %@", error);
            }];
        }else{
            [manager GET:requestUri parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
                NSLog(@"JSON: %@", responseObject);
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                NSLog(@"Error: %@", error);
            }];
        }
    }else{
//            String imagePath = api.getFilePath();
//            response = HttpClientUtil.httpPostImage(requestUri, fullParamMap, imagePath, null);
    }
    //对返回结果做通用性检查（主要检查sig参数及session失效），两种情况下都认为失败
    if(response !=nil){
        //子类处理逻辑
        return [api processResponse:response];
    }
    
    return  nil;
}

/*构造http请求参数dict，增加sig等*/
+(NSMutableDictionary *) buildFullParam: (NSDictionary*) requestParamMap{
    
    NSMutableDictionary *fullParamMap = [NSMutableDictionary dictionary];
    //添加业务数据
    [fullParamMap addEntriesFromDictionary:requestParamMap];
    
    [fullParamMap setValue:@"2" forKey:@"app_id"];
    [fullParamMap setValue:@"1.0.0" forKey:@"v_name"];
    [fullParamMap setValue:@"1" forKey:@"v_code"];
    [fullParamMap setValue:@"1234" forKey:@"call_id"];
    
    
    [fullParamMap setValue:@"2" forKey:@"clientType"];
    [fullParamMap setValue:@"1" forKey:@"versionCode"];
    [fullParamMap setValue:@"jinwanr_ios" forKey:@"channel"];
    
    
    
    //取出keys
    NSArray *fullParamKeys = [fullParamMap allKeys];
    //对keys进行字典排序
    NSArray *sortedKeys = [fullParamKeys sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    //NSMutableArray *sortedValues = [[NSMutableArray alloc]init];
    
    //排序后的valueArray
    
    NSString *paramPlainText = @"";//初始化为空串
    //拼接参数key-value
    for(id key in sortedKeys){
        id value = [fullParamMap objectForKey:key];
        
        paramPlainText = [paramPlainText stringByAppendingString:key];
        paramPlainText = [paramPlainText stringByAppendingString:@"="];
        paramPlainText = [paramPlainText stringByAppendingString:value];
    }
    
    NSString *secretKey = @"1qaz2wsx";
    NSLog(@"======secretKey: %@", secretKey);
    
    NSString *value = [[self limitedString:paramPlainText limit:500] stringByAppendingString:secretKey];
    NSLog(@"======value: %@", value);
    //计算签名
    NSString *sig = [MD5Util md5:value];
    NSLog(@"======sig: %@", sig);
    
    [fullParamMap setValue:sig forKey:@"sig"];
    return fullParamMap;
}

+(NSString *)limitedString:(NSString *) str limit:(int) limit{
    if([str length]>limit){
        return [str substringToIndex:limit];
    }
    return str;
}

@end

