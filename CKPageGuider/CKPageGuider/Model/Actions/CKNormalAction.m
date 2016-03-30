//
//  CKNormalAction.m
//  CKPageGuider
//
//  Created by 仇弘扬 on 16/3/16.
//  Copyright © 2016年 仇弘扬. All rights reserved.
//

#import "CKNormalAction.h"
#import "CKNormalActionView.h"

@interface CKNormalAction ()

@property (nonatomic, weak) UIView *focusView;
@property (nonatomic, assign) CGRect focusRect;

@property (nonatomic, weak) CKNormalActionView *actionView;

@end

@implementation CKNormalAction

+ (instancetype)actionWithFocusView:(UIView *)view direction:(CKPageActionDirection)direction description:(NSString *)description
{
    return [[CKNormalAction alloc] initWithFocusView:view direction:direction description:description];
}

- (instancetype)initWithFocusView:(UIView *)view direction:(CKPageActionDirection)direction description:(NSString *)description
{
    
    self = [self init];
    
    if (self) {
        self.direction = direction;
        self.focusView = view;
        self.actionTip = description;
    }
    
    return self;
}

+ (instancetype)actionWithFocusBarItem:(UIBarButtonItem *)item direction:(CKPageActionDirection)direction description:(NSString *)description
{
    return [[CKNormalAction alloc] initWithFocusView:[item valueForKey:@"_view"] direction:direction description:description];
}

+ (instancetype)actionWithFocusRect:(CGRect)rect direction:(CKPageActionDirection)direction description:(NSString *)description
{
    return [[CKNormalAction alloc] initWithFocusRect:rect direction:direction description:description];
}

- (instancetype)initWithFocusRect:(CGRect)rect direction:(CKPageActionDirection)direction description:(NSString *)description
{
    
    self = [self init];
    
    if (self) {
        self.direction = direction;
        self.focusRect = rect;
        self.actionTip = description;
    }
    
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.lineLength = 40.f;
        self.cornerRadius = 3.f;
        self.margin = UIEdgeInsetsMake(2, 2, 2, 2);
    }
    return self;
}

- (void)showInView:(UIView *)superView
{
    CKNormalActionView *actionView = [[NSBundle mainBundle] loadNibNamed:@"CKNormalActionView" owner:self options:nil].firstObject;
    
    CGRect frame = actionView.bounds;
    CGRect focusFrame = self.focusRect;
    
    CGPoint center = CGPointZero;
    CGPoint focusCenter = CGPointMake(CGRectGetMidX(focusFrame), CGRectGetMidY(focusFrame));
    
    static CGFloat spaceBetweenBracketAndFocusFrame = 3;
    spaceBetweenBracketAndFocusFrame = 3 * [UIScreen mainScreen].scale;
    
    if (self.direction == CKPageActionDirectionLeft || self.direction == CKPageActionDirectionRight) {
        frame.size.height = (focusFrame.size.height - self.margin.top - self.margin.bottom) * 0.9;
    }
    
    if (self.direction == CKPageActionDirectionUp || self.direction == CKPageActionDirectionDown) {
        frame.size.width = (focusFrame.size.width - self.margin.left - self.margin.right) * 0.9;
    }
    
    switch (self.direction) {
        case CKPageActionDirectionLeft:
        {
            center.y = focusCenter.y;
            center.x = focusCenter.x - frame.size.width / 2 - focusFrame.size.width / 2 - spaceBetweenBracketAndFocusFrame - focusFrame.size.width * 0.1 / 2 - self.margin.right;
            break;
        }
        case CKPageActionDirectionRight:
        {
            center.y = focusCenter.y;
            center.x = focusCenter.x + frame.size.width / 2 + focusFrame.size.width / 2 + spaceBetweenBracketAndFocusFrame + self.margin.left;
            break;
        }
        case CKPageActionDirectionUp:
        {
            center.y = focusCenter.y - frame.size.height / 2 - focusFrame.size.height / 2 - spaceBetweenBracketAndFocusFrame + self.margin.top;
            center.x = focusCenter.x;
            break;
        }
        case CKPageActionDirectionDown:
        default:
            center.y = focusCenter.y + frame.size.height / 2 + focusFrame.size.height / 2 + spaceBetweenBracketAndFocusFrame - self.margin.bottom;
            center.x = focusCenter.x;
            break;
    }
    actionView.center = center;
    
    CGRect targetFrame = actionView.frame;
    targetFrame.size.width = frame.size.width;
    targetFrame.size.height = frame.size.height;
    actionView.frame = targetFrame;
    
    actionView.center = center;
    
    [superView addSubview:actionView];
    
    actionView.action = self;
    self.actionView = actionView;
    [actionView show];
}

- (void)setFocusView:(UIView *)focusView
{
    _focusView = focusView;
    _focusRect = [[UIApplication sharedApplication].keyWindow convertRect:focusView.frame fromView:focusView.superview];
}

- (void)setMargin:(UIEdgeInsets)margin
{
    _margin = UIEdgeInsetsMake(-margin.top, -margin.left, -margin.bottom, -margin.right);
}

- (CGRect)actionFocusRect
{
    UIEdgeInsets margin = self.margin;
//    CGRect frame = CGRectMake(self.focusRect.origin.x - margin,
//                              self.focusRect.origin.y - margin,
//                              self.focusRect.size.width + 2 * margin,
//                              self.focusRect.size.height + 2 * margin);
    CGRect rect = self.focusRect;
//    CGRect frame = CGRectMake(rect.origin.x + margin.left, rect.origin.y + margin.top, rect.size.width - margin.left - margin.right, rect.size.height - margin.top - margin.bottom);
    CGRect frame = UIEdgeInsetsInsetRect(rect, margin);
    return frame;
}

- (CGFloat)finalCornerRadius
{
    CGFloat toReturn = self.cornerRadius;
    
    if (self.focusView) {
        if (self.focusView.layer.cornerRadius > 0.1) {
            toReturn = self.focusView.layer.cornerRadius;
        }
    }
    
    return toReturn;
}

@end
