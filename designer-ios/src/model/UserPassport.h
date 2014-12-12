#import <Foundation/Foundation.h>


@interface UserPassport : NSObject

@property (readonly, nonatomic) NSUInteger userId;
@property (readonly, nonatomic) NSString *ticket;
@property (readonly, nonatomic) NSString *userSecretKey;

@end
