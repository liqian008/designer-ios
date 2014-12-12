#import <Foundation/Foundation.h>


@interface Album : NSObject

@property (readonly, nonatomic) NSUInteger id;
@property (readonly, nonatomic) NSString *title;
@property (readonly, nonatomic) NSString *remark;
@property (readonly, nonatomic) NSLong *price;
@property (readonly, nonatomic) NSString *link;
@property (readonly, nonatomic) NSUInteger userId;
@property (readonly, nonatomic) NSString *coverLargeImg;
@property (readonly, nonatomic) NSString *coverMediumImg;
@property (readonly, nonatomic) NSString *coverSmallImg;


@property (readonly, nonatomic) NSString *status;
@property (readonly, nonatomic) NSString *createTime;
@property (readonly, nonatomic) NSString *updateTime;

- (instancetype)initWithAttributes:(NSDictionary *)attributes;

@end
