#import <Foundation/Foundation.h>


@interface UserFollow : NSObject

@property (readonly, nonatomic) NSUInteger id;
@property (readonly, nonatomic) NSUInteger userId;
@property (readonly, nonatomic) NSUInteger followId;
@property (readonly, nonatomic) NSString *createTime;
@property (readonly, nonatomic) NSString *updateTime;

@end
