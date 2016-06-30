//
//  QYCustomUIConfig.h
//  QYCustomUIConfig
//
//  Created by towik on 12/21/15.
//  Copyright (c) 2015 Netease. All rights reserved.
//

/**
 *  提供了所有自定义UI的接口；如果想要替换图片素材，可以在QYCustomResource.bundle中放置跟QYResource.bundle中同名的图片素材，即可对应替换
 */
@interface QYCustomUIConfig : NSObject

/**
 *  恢复成默认设置
 *
 *  @return void
 */
- (void)restoreToDefault;

/**
 *  会话窗口上方提示条中的文本字体颜色
 */
@property (nonatomic, strong) UIColor *sessionTipTextColor;

/**
 *  会话窗口上方提示条中的文本字体大小
 */
@property (nonatomic, assign) CGFloat sessionTipTextFontSize;

/**
 *  访客文本消息字体颜色
 */
@property (nonatomic, strong) UIColor *customMessageTextColor;

/**
 *  访客文本消息字体大小
 */
@property (nonatomic, assign) CGFloat customMessageTextFontSize;

/**
 *  客服文本消息字体颜色
 */
@property (nonatomic, strong) UIColor *serviceMessageTextColor;

/**
 *  客服文本消息字体大小
 */
@property (nonatomic, assign) CGFloat serviceMessageTextFontSize;

/**
 *  提示文本消息字体颜色
 */
@property (nonatomic, strong) UIColor *tipMessageTextColor;

/**
 *  提示文本消息字体大小
 */
@property (nonatomic, assign) CGFloat tipMessageTextFontSize;

/**
 *  输入框文本消息字体颜色
 */
@property (nonatomic, strong) UIColor *inputTextColor;

/**
 *  输入框文本消息字体大小
 */
@property (nonatomic, assign) CGFloat inputTextFontSize;

/**
 *  消息tableview的背景图片
 */
@property (nonatomic, strong) UIImageView *sessionBackground;

/**
 *  会话窗口上方提示条中的背景颜色
 */
@property (nonatomic, strong) UIColor *sessionTipBackgroundColor;

/**
 *  访客头像
 */
@property (nonatomic, strong) UIImage *customerHeadImage;

/**
 *  客服头像
 */
@property (nonatomic, strong) UIImage *serviceHeadImage;

/**
 *  访客消息气泡normal图片
 */
@property (nonatomic, strong) UIImage *customerMessageBubbleNormalImage;

/**
 *  客服消息气泡normal图片
 */
@property (nonatomic, strong) UIImage *serviceMessageBubbleNormalImage;

/**
 *  访客消息气泡pressed图片
 */
@property (nonatomic, strong) UIImage *customerMessageBubblePressedImage;

/**
 *  客服消息气泡pressed图片
 */
@property (nonatomic, strong) UIImage *serviceMessageBubblePressedImage;

/**
 *  消息竖直方向间距
 */
@property (nonatomic, assign) CGFloat sessionMessageSpacing;

/**
 *  是否显示头像
 */
@property (nonatomic, assign) BOOL showHeadImage;

/**
 *  默认是YES,默认rightBarButtonItem内容是黑色，设置为NO，可以修改为白色
 */
@property (nonatomic, assign) BOOL rightBarButtonItemColorBlackOrWhite;

@end



