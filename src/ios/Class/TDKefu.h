//
//  TDKefu.h
//  HelloCordova
//
//  Created by 路亮亮 on 16/6/30.
//
//

#import <Cordova/CDVPlugin.h>

@interface TDKefu : CDVPlugin

- (void)tdRegisterKefu:(CDVInvokedUrlCommand*)command;
- (void)tdConnectKefu:(CDVInvokedUrlCommand*)command;
- (void)tdLogoutKefu:(CDVInvokedUrlCommand*)command;

@end
