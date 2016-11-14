//
//  UIButton+ClickOnce.m
//  设置按钮的背景色（不可选中颜色）
//
//  Created by zhouyun on 2016/11/14.
//  Copyright © 2016年 zhouyun. All rights reserved.
//

#import "UIButton+ClickOnce.h"
#import  <objc/runtime.h>


static const char *UIControl_acceptEventInterval = "UIControl_acceptEventInterval";

static const char *zy_ignoreEventKey = "zy_ignoreEventKey";

@implementation UIButton (ClickOnce)

+ (void)load
{
    Method a = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
    Method b = class_getInstanceMethod(self, @selector(zy_sendAction:to:forEvent:));
    method_exchangeImplementations(a, b);
}


- (void)zy_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event
{
    if (self.zy_ignoreEvent) return;
    
    if (self.zy_acceptEventInterval > 0)
    {
        self.zy_ignoreEvent = YES;
        
        //        [self performSelector:@selector(setZy_ignoreEvent:)
        //                   withObject:@(NO)
        //                   afterDelay:self.zy_acceptEventInterval];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.zy_acceptEventInterval * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            self.zy_ignoreEvent = NO;
            
        });
    }
    [self zy_sendAction:action to:target forEvent:event];
}


#pragma mark - Properties

/**
 * 时间间隔
 */
- (NSTimeInterval)zy_acceptEventInterval
{
    return [objc_getAssociatedObject(self, &UIControl_acceptEventInterval) doubleValue];
}

- (void)setZy_acceptEventInterval:(NSTimeInterval)zy_acceptEventInterval
{
    objc_setAssociatedObject(self, &UIControl_acceptEventInterval, @(zy_acceptEventInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


/**
 * 是否忽略点击事件
 */
- (BOOL)zy_ignoreEvent
{
    return [objc_getAssociatedObject(self, &zy_ignoreEventKey) boolValue];
}


- (void)setZy_ignoreEvent:(BOOL)zy_ignoreEvent
{
    objc_setAssociatedObject(self, &zy_ignoreEventKey, @(zy_ignoreEvent), OBJC_ASSOCIATION_ASSIGN);
}



@end
