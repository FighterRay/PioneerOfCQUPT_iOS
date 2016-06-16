//
//  MainTabBarViewController.m
//  PioneerOfCQUPT_iOS
//
//  Created by 张润峰 on 16/6/16.
//  Copyright © 2016年 张润峰. All rights reserved.
//

#import "MainTabBarViewController.h"

@interface MainTabBarViewController ()

@end

@implementation MainTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //初始化TabBar标签
    UITabBarItem *homePageItem = self.tabBar.items[0];
    UITabBarItem *newsItem = self.tabBar.items[1];
    UITabBarItem *communityItem = self.tabBar.items[2];
    UITabBarItem *userItem = self.tabBar.items[3];
    
    homePageItem.title = @"首页";
    newsItem.title = @"咨询";
    communityItem.title = @"学习心得";
    userItem.title = @"个人中心";
    
    homePageItem.image = [UIImage imageNamed:@"homePage"];
    newsItem.image = [UIImage imageNamed:@"news"];
    communityItem.image = [UIImage imageNamed:@"community"];
    userItem.image = [UIImage imageNamed:@"user"];
    
    
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
