#import <Foundation/Foundation.h>


@interface User : NSObject

//user

@property (readonly, nonatomic) NSUInteger id;
@property (readonly, nonatomic) NSString *username;
@property (readonly, nonatomic) NSString *nickname;
@property (readonly, nonatomic) NSString *password;
@property (readonly, nonatomic) NSString *gender;
@property (readonly, nonatomic) NSString *email;
@property (readonly, nonatomic) NSString *headImg;

@property (readonly, nonatomic) NSString *status;
@property (readonly, nonatomic) NSString *createTime;
@property (readonly, nonatomic) NSString *updateTime;


//designer

@property (readonly, nonatomic) NSUInteger designerIdentifer;
@property (readonly, nonatomic) NSString *designerRealname;
@property (readonly, nonatomic) NSString *designerMobile;
@property (readonly, nonatomic) NSString *designerIntroduction;
@property (readonly, nonatomic) NSString *designerCompany;
@property (readonly, nonatomic) NSString *designerTaobaoHomepage;
@property (readonly, nonatomic) NSString *designerApplyTime;
@property (readonly, nonatomic) NSString *designerPassTime;


- (instancetype)initWithAttributes:(NSDictionary *)attributes;

@end
