//
//  CKToastActionView.m
//  CKPageGuider
//
//  Created by 仇弘扬 on 16/3/16.
//  Copyright © 2016年 仇弘扬. All rights reserved.
//

#import "CKToastActionView.h"

@interface CKToastActionView ()
@property (weak, nonatomic) IBOutlet UILabel *labelOfTip;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation CKToastActionView

- (void)show
{
    self.layer.cornerRadius = 3.f;
    self.labelOfTip.text = self.action.actionTip;
    self.imageView.image = [self toastAction].image;
}

- (CKToastAction *)toastAction
{
    return (CKToastAction *)self.action;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
