//
//  DetailViewController.h
//  PioneerOfCQUPT_iOS
//
//  Created by 李展 on 16/6/20.
//  Copyright © 2016年 张润峰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *fromLabel;
@property (weak, nonatomic) IBOutlet UILabel *authorLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIWebView *contentWebView;
@property NSString *detailTitle;
@property NSString *detailContent;
@property NSString *detailTime;
@property NSString *detailAuthor;
@property NSString *detailFrom;
@end
