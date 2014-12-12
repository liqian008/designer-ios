#import <Foundation/Foundation.h>


@interface UserFan : NSObject

@property (readonly, nonatomic) NSUInteger id;
@property (readonly, nonatomic) NSUInteger userId;
@property (readonly, nonatomic) NSUInteger fanId;
@property (readonly, nonatomic) NSString *createTime;
@property (readonly, nonatomic) NSString *updateTime;

@end
