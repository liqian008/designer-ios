
#import <Foundation/Foundation.h>
#import "ApiResult.h"
#import "AbstractApi.h"

@interface SystemCheckApi:AbstractApi


-(id)initWithParam:(NSString *)clientType
                  versionCode:(NSString *)versionCode
               channel:(NSString *)channel;

@end
