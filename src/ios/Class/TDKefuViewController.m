//
//  TDKefuViewController.m
//  泰瑞眼科
//
//  Created by 路亮亮 on 16/7/1.
//
//

#import "TDKefuViewController.h"
#import "QYSDK.h"

@interface TDKefuViewController ()

@end

@implementation TDKefuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self gotoKefuView];
}

- (void)gotoKefuView{
    QYSessionViewController *sessionViewController = [[QYSDK sharedSDK] sessionViewController];
    sessionViewController.sessionTitle = @"泰立瑞";
    sessionViewController.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:sessionViewController animated:NO];
    
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
