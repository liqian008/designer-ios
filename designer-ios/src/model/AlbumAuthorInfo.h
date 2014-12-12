#import <Foundation/Foundation.h>


@interface AlbumAuthorInfo : NSObject

@property (readonly, nonatomic) NSString *designerAvatar;
@property (readonly, nonatomic) NSString *designerNickname;
@property (readonly, nonatomic) NSString *followed;


- (instancetype)initWithAttributes:(NSDictionary *)attributes;

@end
