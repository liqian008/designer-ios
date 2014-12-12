#import <Foundation/Foundation.h>


@interface AlbumSlide : NSObject

@property (readonly, nonatomic) NSUInteger id;
@property (readonly, nonatomic) NSString *title;
@property (readonly, nonatomic) NSString *remark;
@property (readonly, nonatomic) NSUInteger albumId;
@property (readonly, nonatomic) NSUInteger userId;
@property (readonly, nonatomic) NSString *slideLargeImg;
@property (readonly, nonatomic) NSString *slideMediumImg;
@property (readonly, nonatomic) NSString *slideSmallImg;

@property (readonly, nonatomic) NSString *createTime;
@property (readonly, nonatomic) NSString *updateTime;

@end
