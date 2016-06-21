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
    self.authorLabel.text = [NSString stringWithFormat:@"作者:%@",self.detailAuthor];
    self.timeLabel.text = [NSString stringWithFormat:@"发布时间:%@",self.detailTime];
    self.fromLabel.text = [NSString stringWithFormat:@"来源:%@",self.detailFrom];
    NSString *html_str = [NSString stringWithString:self.detailContent];
    html_str = [self getZZwithString:html_str];
    [self.contentWebView loadHTMLString:html_str baseURL:nil];
    self.titleLabel.text = self.detailTitle;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSString *)getZZwithString:(NSString *)string{
    NSRegularExpression *regularExpretion=[NSRegularExpression regularExpressionWithPattern:@"<[^>]*>|\n" options:0                                                                                      error:nil];
    string=[regularExpretion stringByReplacingMatchesInString:string options:NSMatchingReportProgress range:NSMakeRange(0, string.length) withTemplate:@""];
    return string;
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
