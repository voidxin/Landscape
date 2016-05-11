//
//  LandscapeViewController.m
//  LandscapeDemo
//
//  Created by 张新 on 16/5/11.
//  Copyright © 2016年 zhangxin. All rights reserved.
//
//可以调用UIDevice的方式去改变，直接设置 UIDevice 的 orientation，但是这种方式上传到appstore是会被拒绝的，所以实现屏幕横屏，这里使用的是选择tabbarController的方法
#import "LandscapeViewController.h"
#import "CustomerTabBarController.h"
@interface LandscapeViewController(){
    BOOL _isLandscape;
}
@end
@implementation LandscapeViewController
- (void)viewDidLoad{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor grayColor]];
   
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //旋转屏幕，但是只旋转当前的View
    self.tabBarController.view.transform = CGAffineTransformMakeRotation(M_PI/2);
    CGRect bounds = [UIScreen mainScreen].bounds;
    self.tabBarController.view.bounds =CGRectMake(0, 0, bounds.size.height, bounds.size.width);
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    //页面即将消失的时候旋转回来成竖屏
    self.tabBarController.view.transform = CGAffineTransformMakeRotation(M_PI*4);
    CGRect bounds = [UIScreen mainScreen].bounds;
    self.tabBarController.view.bounds =CGRectMake(0, 0, bounds.size.width, bounds.size.height);
}
//隐藏状态栏
-(BOOL)prefersStatusBarHidden{
    return YES;
}

// 为了实现强制横屏，所以要关闭页面的自动选择功能
- (BOOL)shouldAutorotate{
    return NO;
}



@end
