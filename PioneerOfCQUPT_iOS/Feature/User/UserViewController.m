//
//  UserViewController.m
//  PioneerOfCQUPT_iOS
//
//  Created by 张润峰 on 16/6/17.
//  Copyright © 2016年 张润峰. All rights reserved.
//

#import "UserViewController.h"

typedef NS_ENUM(NSUInteger, MeTableCellType) {
    UserTableCellTypeAvatar     = 0,
    UserTableCellTypeMessege  = 1,
    UserTableCellTypeSetting     = 2,
    MeTableCellTypeAbout      = 3,
    MeTableCellTypeSpace      = 4
};

@interface UserViewController ()<UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UIPopoverPresentationControllerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *dataArray;//保存枚举值

@end

@implementation UserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.dataArray = [[NSMutableArray alloc] initWithObjects:@(UserTableCellTypeAvatar), @(MeTableCellTypeSpace), @(UserTableCellTypeMessege), @(UserTableCellTypeSetting), @(MeTableCellTypeAbout), nil];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self setupSubviews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupSubviews {
    self.tableView.backgroundColor = [UIColor colorWithRed:241.0/255.0 green:242/255.0 blue:246.0/255.0 alpha:1.0];
    [self.tableView reloadData];
}

#pragma mark - UITableView Datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSUInteger type = [self.dataArray[indexPath.row] unsignedIntegerValue];
    switch (type) {
        case UserTableCellTypeAvatar:
            return 234;
            break;
        case MeTableCellTypeSpace:
            return 7;
        default:
            break;
    }
    
    return 42;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSUInteger type = [self.dataArray[indexPath.row] unsignedIntegerValue];
    switch (type) {
        case MeTableCellTypeSpace:
            return [self spaceTableViewCell:tableView index:indexPath];
            break;
        case UserTableCellTypeAvatar:
            return [self avatarTableViewCell:tableView index:indexPath];
            break;
        default:
            return [self titleTableViewCell:tableView indexPath:indexPath type:type];
            break;
    }
}

- (UITableViewCell *)spaceTableViewCell:(UITableView *)tableView index:(NSIndexPath *) indexPath {
    static NSString *cellIdentifier = @"SpaceCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.contentView.backgroundColor = [UIColor colorWithRed:241.0/255.0 green:242/255.0 blue:246/255.0 alpha:1.0];
    return cell;
}

- (UITableViewCell *)avatarTableViewCell:(UITableView *)tableView index:(NSIndexPath *) indexPath {
    static NSString *cellIdentifer = @"AvatarCell";
    AvatarTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifer];
    if (!cell) {
        cell = [[AvatarTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifer];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    return cell;
}

-(UITableViewCell *)titleTableViewCell:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath type:(MeTableCellType)type{
    static NSString *cellIdentifier = @"TitleCell";
    TitleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil) {
        cell = [[TitleTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    switch (type) {
        case UserTableCellTypeMessege:{
            cell.titleLabel.text = @"我的动态";
            cell.icon.image = [UIImage imageNamed:@"message"];
        }
            break;
        case UserTableCellTypeSetting:{
            cell.titleLabel.text = @"设置";
            cell.icon.image = [UIImage imageNamed:@"setting"];
        }
            break;
        case MeTableCellTypeAbout:{
            cell.titleLabel.text = @"关于";
            cell.icon.image = [UIImage imageNamed:@"about"];
        }
            break;
        default:
            break;
    }
    return cell;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
// Get the new view controller using [segue destinationViewController].
// Pass the selected object to the new view controller.
    if ([segue.identifier  isEqual: @"testPopover"]) {
        segue.destinationViewController.popoverPresentationController.delegate = self;
    }
}

- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller {
    return UIModalPresentationNone;
}

@end
