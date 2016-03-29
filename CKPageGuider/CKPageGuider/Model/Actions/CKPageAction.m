//
//  CKPageAction.m
//  CKPageGuider
//
//  Created by 仇弘扬 on 16/3/16.
//  Copyright © 2016年 仇弘扬. All rights reserved.
//

#import "CKPageAction.h"

@implementation CKPageAction

- (void)setActionTip:(NSString *)actionTip
{
    _actionTip = [actionTip copy];
    [self caculateTipRect];
}

- (void)caculateTipRect
{
    self.actionTipRect = [self.actionTip boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14]} context:nil];
}

- (void)showInView:(UIView *)superView
{
    
}

@end
