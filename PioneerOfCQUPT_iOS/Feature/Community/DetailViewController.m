//
//  DetailViewController.m
//  PioneerOfCQUPT_iOS
//
//  Created by 李展 on 16/6/20.
//  Copyright © 2016年 张润峰. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel *lb1 = [[UILabel alloc]initWithFrame:CGRectMake(0, 60, 375, 100)];
    UIWebView *webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 180, 375, 300)];
    NSString *html_str = [NSString stringWithString:self.detailContent];
    [webView loadHTMLString:html_str baseURL:nil];
    lb1.text = self.detailTitle;
    lb1.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:lb1];
    [self.view addSubview:webView];
    // Do any additional setup after loading the view.
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
