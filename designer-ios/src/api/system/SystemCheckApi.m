
#import <Foundation/Foundation.h>
#import "ApiResult.h"
#import "SystemCheckApi.h"

/**
 * 系统检查API，在唯一入口splash页面进行调用，主要做两件事情
 * 1、检查客户端版本更新并返回
 * 2、返回用户信息（如果客户端需要强制更新，则不返回本段内容）
 * @author liqian
 */

@interface SystemCheckApi()

@end

@implementation SystemCheckApi




-(BOOL) needAuth{
    return NO;
}

/*抽象方法，apiMethodName*/
-(NSString *) getApiMethodName{
    return @"systemCheck.cmd";
}


///*abstract抽象方法，子类需要构造业务数据*/
//-(void) fillDataMap: (NSDictionary*) paramMap{
//    NSMutableDictionary *requestMap = [NSMutableDictionary dictionary];
//    [requestMap addEntriesFromDictionary:paramMap];
//}

@end
