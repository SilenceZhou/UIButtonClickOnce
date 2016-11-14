//
//  ViewController.m
//  UIButtonClickOnce
//
//  Created by SilenceZhou on 2016/11/14.
//  Copyright © 2016年 silence. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+ClickOnce.h"



@implementation ViewController


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // 带时间间隔
    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 200, 60)];
    btn1.zy_acceptEventInterval = 1;
    btn1.backgroundColor = [UIColor blueColor];
    [btn1 addTarget:self action:@selector(btn1Click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    // 不带时间间隔
    UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(100, 300, 200, 60)];
    btn2.backgroundColor = [UIColor brownColor];
    [btn2 addTarget:self action:@selector(btn2Click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
}

- (void)btn1Click
{
    NSLog(@"======btn1Click=======");
}


- (void)btn2Click
{
    NSLog(@"======btn2Click=======");
}


@end
