#import <Foundation/Foundation.h>


@interface Message : NSObject

@property (readonly, nonatomic) NSULong id;
@property (readonly, nonatomic) NSString *message;
@property (readonly, nonatomic) NSUInteger messageType;

@property (readonly, nonatomic) NSUShort sourceType;
@property (readonly, nonatomic) NSULong sourceId;
@property (readonly, nonatomic) NSString *sourceDesc;

@property (readonly, nonatomic) NSUInteger fromId;
@property (readonly, nonatomic) NSUInteger toId;
@property (readonly, nonatomic) NSUInteger unread;
@property (readonly, nonatomic) NSUInteger status;

@property (readonly, nonatomic) NSString *createTime;
@property (readonly, nonatomic) NSString *updateTime;


@end
