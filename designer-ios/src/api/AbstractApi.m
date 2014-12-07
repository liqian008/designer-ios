

#import <Foundation/Foundation.h>
#import "AbstractApi.h"
#import "ApiResult.h"
#import "JSONKit.h"


@interface AbstractApi()

@property(nonatomic)BOOL multipart;

@end

@implementation AbstractApi:NSObject

-(NSString*) getRequestUri{
    return @"";
}

-(BOOL) needAuth{
    return YES;
}


/*抽象方法，统一后可均使用post*/
-(NSString*) getRequestMethod{
    return @"post";
}


/*抽象方法，apiMethodName*/
//-(NSString *) getApiMethodName{
//    return nil;
//}

/*abstract抽象方法，子类需要构造业务数据*/
-(void) fillDataMap: (NSMutableDictionary*) paramMap{
    
}


-(ApiResult *) processApiResult: (int)result errorcode: (int) errorcode message: (NSString *) message dataStr: (NSString *) dataStr{
    return nil;
}

/*构造请求map*/
-(NSMutableDictionary*) getParamMap{
    //构造method名称
    NSString * apiMethodName = [self getApiMethodName];
    NSMutableDictionary *paramMap = [NSMutableDictionary dictionaryWithObjectsAndKeys: apiMethodName, @"cmd_method", nil];
    
    //subApi构造业务请求参数
    fillDataMap:paramMap;
    return nil;
}


-(BOOL) isMultipart{
    return _multipart;
}

-(void) setMultipart:(BOOL)multipart{
    _multipart = multipart;
}

-(ApiResult *) processResponse: (NSString*) responseStr{
    
    //解析json
    NSData *responseData = [responseStr dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *responseDict = [responseData objectFromJSONData];
    
    NSNumber *result = [responseDict valueForKey:@"result"];
    NSNumber *errorcode = [responseDict valueForKey:@"errorcode"];
    NSString *message = [responseDict valueForKey:@"message"];
    NSString *dataStr = [responseDict valueForKey:@"data"];
    
    if(result!=1){//处理平台级的异常
        
    }
    //交由子类处理业务数据
    return [self processApiResult:result errorcode:errorcode message:message dataStr:dataStr];
}




@end