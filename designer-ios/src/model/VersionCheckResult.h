#import <Foundation/Foundation.h>


@interface VersionCheckResult : NSObject

@property (readonly, nonatomic) NSUInteger updateStatus;
@property (readonly, nonatomic) NSString *updateTitle;
@property (readonly, nonatomic) NSString *updateRemark;
@property (readonly, nonatomic) NSString *updateUrl;

@property (readonly, nonatomic) NSString *agreeText;
@property (readonly, nonatomic) NSString *deniedText;

@end
