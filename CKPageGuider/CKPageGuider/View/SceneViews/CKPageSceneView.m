//
//  CKPageSceneView.m
//  CKPageGuider
//
//  Created by 仇弘扬 on 16/3/16.
//  Copyright © 2016年 仇弘扬. All rights reserved.
//

#import "CKPageSceneView.h"
#import "CKNormalAction.h"
#import "CKToastAction.h"
#import "CKPageGuiderView.h"

@implementation CKPageSceneView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self lazyInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self lazyInit];
    }
    return self;
}

- (void)lazyInit
{
    self.backgroundColor = [UIColor colorWithWhite:0.f alpha:0.8];
}

- (void)didMoveToSuperview
{
    if (self.superview) {
        [self show];
    }
}

- (void)show
{
    self.alpha = 0.f;
    [self handleMask];
//	[UIApplication sharedApplication].keyWindow.userInteractionEnabled = NO;
    [UIView animateWithDuration:.25f animations:^{
        self.alpha = 1.0f;
    } completion:^(BOOL finished) {
//		[UIApplication sharedApplication].keyWindow.userInteractionEnabled = YES;
	}];
}
- (void)hide:(void(^)())finish
{
    [UIView animateWithDuration:.25f animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        if (finish) {
            finish();
        }
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"scene touches began");
    if ([self.superview isKindOfClass:[CKPageGuiderView class]]) {
        CKPageGuiderView *guiderView = (CKPageGuiderView *)self.superview;
        [guiderView.guider next];
    }
}

- (void)handleMask
{
    CAShapeLayer *shapeLayer = [[CAShapeLayer alloc] init];
    UIBezierPath *path = [UIBezierPath bezierPath];
    for (CKPageAction *action in self.scene.actions) {
        if ([action isKindOfClass:[CKNormalAction class]]) {
            CKNormalAction *normalAction = (CKNormalAction *)action;
            
            UIBezierPath *focusPath = [[UIBezierPath bezierPathWithRoundedRect:[normalAction actionFocusRect] cornerRadius:[normalAction finalCornerRadius]] bezierPathByReversingPath];
            [path appendPath:focusPath];
            
        }
    }
    [path appendPath:[UIBezierPath bezierPathWithRect:[UIScreen mainScreen].bounds]];
    shapeLayer.path = [path bezierPathByReversingPath].CGPath;
    self.layer.mask = shapeLayer;
}

- (void)setScene:(CKPageScene *)scene
{
    _scene = scene;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
//- (void)drawRect:(CGRect)rect {
//    // Drawing code
//    [[UIColor clearColor] setFill];
//    
//    
//    
//}

@end
