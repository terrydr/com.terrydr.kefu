//
//  TDKefu.m
//  HelloCordova
//
//  Created by 路亮亮 on 16/6/30.
//
//

#import "TDKefu.h"
#import "QYSDK.h"

//七鱼客服
#define QYSERVICE_KEY         @"c1babe7f57e28c009565369c1da798bf"
#define RGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0 blue:((float)(rgbValue & 0xFF)) / 255.0 alpha:1.0]

@implementation TDKefu

- (void)tdRegisterKefu:(CDVInvokedUrlCommand*)command{
    [[QYSDK sharedSDK] registerAppId:QYSERVICE_KEY appName:@"泰立瑞"];
}

- (void)tdConnectKefu:(CDVInvokedUrlCommand*)command{
    QYSessionViewController *sessionViewController = [[QYSDK sharedSDK] sessionViewController];
    sessionViewController.sessionTitle = @"泰立瑞";
    sessionViewController.hidesBottomBarWhenPushed = YES;
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:sessionViewController];
    nav.navigationBar.translucent = NO;
    nav.navigationBar.barTintColor = RGB(0x3691e6);
    nav.navigationBar.tintColor = [UIColor whiteColor];
    [nav.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName, [UIFont boldSystemFontOfSize:18.f], NSFontAttributeName, nil]];
    [self.viewController presentViewController:nav animated:YES completion:^{
    }];
    
    QYUserInfo *userInfo = [[QYUserInfo alloc] init];
    userInfo.userId = [NSString stringWithFormat:@"0_%@",@"18639027026"];
    NSString *userName = @"liang";
    NSString *userPhone = @"18639027026";
    userInfo.data = [NSString stringWithFormat:@"[{\"key\":\"real_name\", \"value\":\"%@\"},"
                     "{\"key\":\"mobile_phone\", \"value\":\"%@\"},"
                     "{\"key\":\"email\", \"value\":\"13800000000@163.com\",\"hidden\":true},"
                     "{\"index\":0, \"key\":\"user_type\", \"label\":\"用户类型\", \"value\":\"医生\"},"
                     "{\"index\":1, \"key\":\"source\", \"label\":\"来源\", \"value\":\"泰瑞眼科\"}]",userName,userPhone];
    
    [[QYSDK sharedSDK] setUserInfo:userInfo];
}

@end
