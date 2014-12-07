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

@interface ApiManager()

@end


@implementation ApiManager

//调用api
-(ApiResult*)invoke:(AbstractApi *)api{
    
    //检查网络状态
    BOOL networkAvailable = true;
    if(!networkAvailable){//未联网
       
    }
    
    if(api.needAuth){
        //游客的操作检查
    }
    
    NSString *requestUri = api.getRequestUri;
    NSString *response = nil;
    NSMutableDictionary  *apiParamMap = api.getParamMap;
    NSString *method = api.getRequestMethod;
    //构造完整请求参数
    NSMutableDictionary  *fullParamMap = [self buildFullParam:apiParamMap];
    
    //判断是否是multipart请求
    bool isMultipart = api.isMultipart;
    if(!isMultipart){
        if([@"post" isEqual:[method lowercaseString]]){
                //response = HttpClientUtil.httpGet(requestUri, fullParamMap);
        }else{
//               response = HttpClientUtil.httpPost(requestUri, fullParamMap);
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
-(NSMutableDictionary *) buildFullParam: (NSMutableDictionary*)requestParamMap{
    
//    TreeMap<String, String> fullParamMap = new TreeMap<String, String>();
//    if (param!= null&&param.size()>0) {
//        fullParamMap.putAll(param);
//    }
//    String appVersionName = Config.APP_VERSION_NAME;
//    int appVersionCode = Config.APP_VERSION_CODE;
//    String appId = Config.APP_ID;
//    String secretKey = Config.APP_SECRET_KEY;
    
    
    [requestParamMap setValue:@"" forKey:@"app_id"];
    [requestParamMap setValue:@"" forKey:@"v_name"];
    [requestParamMap setValue:@"" forKey:@"v_code"];
    [requestParamMap setValue:@"" forKey:@"call_id"];
    
    
//    for (Map.Entry<String, String> entry : fullParamMap.entrySet()) {
//        sb.append(entry.getKey()).append('=').append(entry.getValue());
//    }
    
    //字典排序生成plainText
    NSString *plainText = @"";
    
    NSString *secretKey = @"secretkey";
    NSString *value = [[self limitedString:plainText limit:500] stringByAppendingString:secretKey];
    
    NSLog(@"======value: %@", value);
    //计算签名
    NSString *sig = [MD5Util md5:value];
    
    NSLog(@"======secretKey: %@", secretKey);
    NSLog(@"======sig: %@", sig);
    
    [requestParamMap setValue:sig forKey:@"sig"];
    
//    fullParamMap.put("sig", sig);
    
    return requestParamMap;
}

-(NSString *)limitedString:(NSString *) str limit:(int) limit{
    if([str length]>limit){
        return [str substringToIndex:limit];
    }
    return str;
}



@end

