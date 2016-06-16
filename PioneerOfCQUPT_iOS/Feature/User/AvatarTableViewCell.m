//
//  AvatarTableViewCell.m
//  BB
//
//  Created by 张润峰 on 16/6/2.
//  Copyright © 2016年 JiangJinJiuST. All rights reserved.
//

#import "AvatarTableViewCell.h"

@implementation AvatarTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    //设置头像背景
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    effectView.frame = self.avatarBackground.bounds;
    effectView.alpha = .99f;
    
    [self.avatarBackground addSubview:effectView];
    
    //设置头像
    [self.avatar.layer setMasksToBounds:YES];
    [self.avatar.layer setCornerRadius:self.avatar.bounds.size.width/2.0];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
