//
//  QYSDK.h
//  QYSDK
//
//  Created by towik on 12/21/15.
//  Copyright (c) 2015 Netease. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QYHeaders.h"

/**
 *  完成回调
 */
typedef void(^QYCompletionBlock)();


/**
 *  所有SDK接口都从此类获得
 */
@interface QYSDK : NSObject

/**
 *  返回 SDK 单例
 *
 *  @return SDK 单例
 */
+ (instancetype)sharedSDK;

/**
 *  注册SDK
 *
 *  @param appKey  appKey 对应管理后台分配的appkey
 *  @param appName appName(就是SDK 1.0.0版本的cerName,参数名变了) 对应管理后台添加一个app时填写的App名称
 */
- (void)registerAppId:(NSString *)appKey
              appName:(NSString *)appName;

/**
 *  追踪用户浏览信息
 *
 *  @param urlString  浏览url
 *  @param attributes 附加信息
 */
- (void)trackHistory:(NSString *)urlString
      withAttributes:(NSDictionary *)attributes;

/**
 *  添加个人信息。历史遗留接口，目前建议使用轻量CRM方式，使用setUserInfo即可
 *
 *  @param infos 个人信息；目前有两个key，“foreignid”表示用户id，“name”表示用户名
 */
- (void)addUserInfo:(NSDictionary *)infos;

/**
 *  设置个人信息。用户帐号登录成功之后，调用此函数
 *
 *  @param userInfo 个人信息
 */
- (void)setUserInfo:(QYUserInfo *)userInfo;

/**
 *  更新推送token
 *
 *  @param token 推送token
 */
- (void)updateApnsToken:(NSData *)token;

/**
 *  注销当前账号。用户帐号注销时需要调用此函数；切换账号包含注销和登录过程，在注销阶段也要调用此函数
 *
 *  @param completion 完成回调
 */
- (void)logout:(QYCompletionBlock)completion;

/**
 *  返回AppKey
 *
 *  @return appKey
 */
- (NSString *)appKey;

/**
 *  返回客服聊天ViewController，必须push到UINavigationController中
 *
 *  @return 会话ViewController
 */
- (QYSessionViewController *)sessionViewController;

/**
 *  返回会话管理类
 *
 *  @return 会话管理类
 */
- (id<YSFConversationManager>)conversationManager;

/**
 *  返回自定义UI类
 *
 *  @return 自定义UI类
 */
- (QYCustomUIConfig *)customUIConfig;

@end
