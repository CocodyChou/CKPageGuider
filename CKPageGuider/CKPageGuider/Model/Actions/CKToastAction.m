//
//  CKToastAction.m
//  CKPageGuider
//
//  Created by 仇弘扬 on 16/3/16.
//  Copyright © 2016年 仇弘扬. All rights reserved.
//

#import "CKToastAction.h"
#import "CKToastActionView.h"

@interface CKToastAction ()

@property (nonatomic, weak) CKToastActionView *toastView;

@end

@implementation CKToastAction

+ (instancetype)actionWithImage:(UIImage *)image description:(NSString *)description center:(CGPoint)center
{
    return [[CKToastAction alloc] initWithImage:image description:description center:center];
}

- (instancetype)initWithImage:(UIImage *)image description:(NSString *)description center:(CGPoint)center
{
    self = [self init];
    if (self) {
        self.image = image;
        self.actionTip = description;
        self.center = center;
    }
    
    return self;
}

- (void)showInView:(UIView *)superView
{
    CKToastActionView *toastView = [[NSBundle mainBundle] loadNibNamed:@"CKToastActionView" owner:nil options:nil].firstObject;
    toastView.center = self.center;
    [superView addSubview:toastView];
    self.toastView = toastView;
    self.toastView.action = self;
    [toastView show];
}

@end
