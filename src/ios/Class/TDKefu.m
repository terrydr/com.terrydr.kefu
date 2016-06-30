//
//  TDKefu.m
//  HelloCordova
//
//  Created by 路亮亮 on 16/6/30.
//
//

#import "TDKefu.h"
#import "QYSDK.h"

@implementation TDKefu

- (void)tdConnectKefu:(CDVInvokedUrlCommand*)command{
    QYSessionViewController *sessionViewController = [[QYSDK sharedSDK] sessionViewController];
    sessionViewController.sessionTitle = @"泰立瑞";
    sessionViewController.hidesBottomBarWhenPushed = YES;
    [self.viewController.navigationController pushViewController:sessionViewController animated:YES];
    
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
