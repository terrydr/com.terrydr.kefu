//
//  TDKefu.h
//  HelloCordova
//
//  Created by 路亮亮 on 16/6/30.
//
//

#import <Cordova/CDVPlugin.h>

@interface TDKefu : CDVPlugin

- (void)tdConnectKefu:(CDVInvokedUrlCommand*)command;

@end