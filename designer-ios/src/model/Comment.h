#import <Foundation/Foundation.h>


@interface Comment : NSObject

@property (readonly, nonatomic) NSUInteger id;
@property (readonly, nonatomic) NSString *title;
@property (readonly, nonatomic) NSString *comment;
@property (readonly, nonatomic) NSUInteger fromId;
@property (readonly, nonatomic) NSUInteger toId;
@property (readonly, nonatomic) NSUInteger designerId;
@property (readonly, nonatomic) NSUInteger albumId;
@property (readonly, nonatomic) NSString *userHeadImage;
@property (readonly, nonatomic) NSString *nickname;

@property (readonly, nonatomic) NSString *createTime;
@property (readonly, nonatomic) NSString *updateTime;


@end
