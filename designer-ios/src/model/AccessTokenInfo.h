#import <Foundation/Foundation.h>


@interface AccessTokenInfo : NSObject

@property (readonly, nonatomic) NSUInteger id;
@property (readonly, nonatomic) NSUInteger userId;
@property (readonly, nonatomic) NSString *accessToken;
@property (readonly, nonatomic) NSString *refreshToken;


@property (readonly, nonatomic) NSString *tokenType;
@property (readonly, nonatomic) NSString *thirdpartyType;
@property (readonly, nonatomic) NSString *thirdpartyUid;
@property (readonly, nonatomic) NSString *thirdpartyUname;

@property (readonly, nonatomic) NSString *thirdpartyAvatar;
@property (readonly, nonatomic) NSString *expireIn;
@property (readonly, nonatomic) NSString *syncAlbum;
@property (readonly, nonatomic) NSString *creaeTime;
@property (readonly, nonatomic) NSString *upateTime;

@end
