//
//  HomePageWebViewController.m
//  PioneerOfCQUPT_iOS
//
//  Created by 张润峰 on 16/6/21.
//  Copyright © 2016年 张润峰. All rights reserved.
//

#import "HomePageWebViewController.h"
#import <WebKit/WebKit.h>

@interface HomePageWebViewController ()<WKNavigationDelegate>

@end

@implementation HomePageWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    WKWebView *webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
    webView.navigationDelegate = self;
    NSURL *url = [NSURL URLWithString:self.urlString];
    [webView loadRequest:[NSURLRequest requestWithURL: url]];
    [self.view addSubview:webView];
}

#pragma mark - WKNavigationDelegate
//页面开始加载时调用
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    
}

//内容开始返回时调用
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation {
    
}

//页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    
}

//页面加载失败时调用
- (void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error {
    NSLog(@"网页加载失败");
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
