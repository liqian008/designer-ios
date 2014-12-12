#import <Foundation/Foundation.h>


@interface AlbumFavorite : NSObject

@property (readonly, nonatomic) NSUInteger id;
@property (readonly, nonatomic) NSUInteger albumId;
@property (readonly, nonatomic) NSUInteger userId;
@property (readonly, nonatomic) NSString *createTime;
@property (readonly, nonatomic) NSString *updateTime;

@end
