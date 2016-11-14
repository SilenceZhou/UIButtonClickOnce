//
//  UIButton+ClickOnce.h
//  设置按钮的背景色（不可选中颜色）
//
//  Created by zhouyun on 2016/11/14.
//  Copyright © 2016年 zhouyun. All rights reserved.
//  参考作者：http://www.cocoachina.com/ios/20150911/13260.html

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface UIButton (ClickOnce)

/**
 * 设置重复点击加间隔
 */
@property (nonatomic, assign) NSTimeInterval zy_acceptEventInterval;

@end
