//
//  HomePageViewController.m
//  PioneerOfCQUPT_iOS
//
//  Created by 张润峰 on 16/6/17.
//  Copyright © 2016年 张润峰. All rights reserved.
//

#import "HomePageViewController.h"
#import "HomePageWebViewController.h"

@interface HomePageViewController ()

@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    NSString *segueId = segue.identifier;
    int segueIdNum = [segueId intValue];
    
    HomePageWebViewController *hpwVC = (HomePageWebViewController *)segue.destinationViewController;
    switch (segueIdNum) {
        case 1:
            hpwVC.urlString = @"http://lxyz.12371.cn/dzdg/";
            break;
        case 2:
            hpwVC.urlString = @"http://www.12371.cn/special/xjpzyls/xxxjpzyls/";
            break;
        case 3:
            hpwVC.urlString = @"http://lxyz.12371.cn/xjdx/";
            break;
        case 4:
            hpwVC.urlString = @"https://redrock.cqupt.edu.cn/lxyz_activity/";
            break;
        case 5:
            hpwVC.urlString = @"http://lxyz.12371.cn/xjdx/";
            break;
        case 6:
            hpwVC.urlString = @"http://lxyz.12371.cn/jdyx/";
            break;
        default:
            break;
    }
}

@end
