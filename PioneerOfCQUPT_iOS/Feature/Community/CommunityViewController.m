//
//  CommunityViewController.m
//  PioneerOfCQUPT_iOS
//
//  Created by 张润峰 on 16/6/17.
//  Copyright © 2016年 张润峰. All rights reserved.
//

#import "CommunityViewController.h"
#import "LearningMaterialsCell.h"
#import "DetailViewController.h"
#define listURL @"http://202.202.43.42/lxyz/index.php?m=Home&c=index&a=mobilearticlelist"
#define articleURL @"http://202.202.43.42/lxyz/index.php?m=Home&c=Article&a=mobilearticle"
@interface CommunityViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property NSArray *data;
@property NSDictionary *dict;
@property NSDictionary *detailDict;
@property NSDictionary *detailData;
@end

@implementation CommunityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getData];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"banner"] forBarMetrics:UIBarMetricsDefault];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
//    [self.view addSubview:self.tableview];
    // Do any additional setup after loading the view.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.data.count;
}
-(NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"learningCell";
     LearningMaterialsCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(!cell) {
        cell = [[ LearningMaterialsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.title.text = [self.data[indexPath.row] objectForKey:@"title"];
    cell.content.text = [self.data[indexPath.row] objectForKey:@"content"];
    cell.time.text = [self.data[indexPath.row] objectForKey:@"time"];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self getData1:[self.data[indexPath.row] objectForKey:@"id"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) getData{
    if (self.data==nil) {
        dispatch_queue_t q1 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        NSURL *URL = [NSURL URLWithString:listURL];
        dispatch_async(q1, ^{
            NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL];
            request.HTTPMethod = @"POST";
            request.HTTPBody = [@"page=1&id=5" dataUsingEncoding:NSUTF8StringEncoding];
            NSURLSession *session = [NSURLSession sharedSession];
            NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                if (error == nil) {
                    self.dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
                    self.data = [self.dict objectForKey:@"data"];
                }
                dispatch_async(dispatch_get_main_queue(), ^{
                   [self.tableView reloadData];
                });
            }];
            [task resume];
        });
    }
}
-(void) getData1:(NSString *)number{
    DetailViewController *vc = [[UIStoryboard storyboardWithName:@"Community" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"DetailViewController"];
    if (self.detailData==nil) {
        dispatch_queue_t q2 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        NSURL *URL = [NSURL URLWithString:articleURL];
        dispatch_async(q2, ^{
            NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL];
            request.HTTPMethod = @"POST";
            NSString *string = [NSString stringWithFormat:@"id=%@",number];
            request.HTTPBody = [string dataUsingEncoding:NSUTF8StringEncoding];
            NSURLSession *session = [NSURLSession sharedSession];
            NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                if (error == nil) {
                    self.detailDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
                    self.detailData = [self.detailDict objectForKey:@"data"];
                }
                dispatch_async(dispatch_get_main_queue(), ^{
                    vc.detailTitle = [self.detailData objectForKey:@"title"];
                    vc.detailContent = [self.detailData objectForKey:@"content"];
                    vc.detailTime = [self.detailData objectForKey:@"time"];
                    vc.detailFrom = [self.detailData objectForKey:@"from"];
                    vc.detailAuthor = [self.detailData objectForKey:@"author"];
                    [self.navigationController pushViewController:vc animated:YES];
                });
            }];
            [task resume];
        });
    }
    else{
        vc.detailTitle = [self.detailData objectForKey:@"title"];
        vc.detailContent = [self.detailData objectForKey:@"content"];
        vc.detailTime = [self.detailData objectForKey:@"time"];
        vc.detailFrom = [self.detailData objectForKey:@"from"];
        vc.detailAuthor = [self.detailData objectForKey:@"author"];
        [self.navigationController pushViewController:vc animated:YES];
    }
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
