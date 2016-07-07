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
    NSArray *paramArr = command.arguments;
    NSString *appId = [paramArr objectAtIndex:0];
    NSString *appName = [paramArr objectAtIndex:1];
    [[QYSDK sharedSDK] registerAppId:appId appName:appName];
}

- (void)tdConnectKefu:(CDVInvokedUrlCommand*)command{
    
    NSArray *paramArr = command.arguments;
    NSString *sessionTitle = [paramArr objectAtIndex:0];
    NSString *userId = [paramArr objectAtIndex:1];
    NSString *userInfoData = [paramArr objectAtIndex:2];
    
    QYSessionViewController *sessionViewController = [[QYSDK sharedSDK] sessionViewController];
    sessionViewController.sessionTitle = sessionTitle;
    sessionViewController.hidesBottomBarWhenPushed = YES;
    sessionViewController.navigationItem.leftBarButtonItem =
    [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain
                                    target:self action:@selector(onBack:)];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:sessionViewController];
    nav.navigationBar.translucent = NO;
    nav.navigationBar.barTintColor = RGB(0x3691e6);
    nav.navigationBar.tintColor = [UIColor whiteColor];
    [nav.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName, [UIFont boldSystemFontOfSize:18.f], NSFontAttributeName, nil]];
    [self.viewController presentViewController:nav animated:YES completion:^{
        
    }];
    
    QYUserInfo *userInfo = [[QYUserInfo alloc] init];
    userInfo.userId = userId;
    userInfo.data = userInfoData;
    
    [[QYSDK sharedSDK] setUserInfo:userInfo];
}

- (void)onBack:(id)sender{
    [self.viewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)tdLogoutKefu:(CDVInvokedUrlCommand*)command{
    [[QYSDK sharedSDK] logout:^{
        
    }];
}

@end
