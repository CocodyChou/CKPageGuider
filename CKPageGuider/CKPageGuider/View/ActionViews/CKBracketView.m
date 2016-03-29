//
//  CKBracketView.m
//  CKPageGuider
//
//  Created by 仇弘扬 on 16/3/17.
//  Copyright © 2016年 仇弘扬. All rights reserved.
//

#import "CKBracketView.h"

#define CKBracketRadius 3

@implementation CKBracketView

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

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self lazyInit];
    }
    return self;
}

- (void)lazyInit
{
    self.backgroundColor = [UIColor redColor];
}

- (void)handleBracket
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    path.lineWidth = 1;
    path.lineCapStyle = kCGLineCapRound;
    CGRect frame = self.bounds;
    frame = CGRectInset(frame, 1, 1);
    
    [[UIColor whiteColor] setStroke];
    
//    CGPoint leftMidYPoint = CGPointMake(CGRectGetMinX(frame), CGRectGetMidY(frame));
//    CGPoint leftTopYPoint = CGPointMake(CGRectGetMinX(frame), CGRectGetMinY(frame));
    CGPoint leftBottomYPoint = CGPointMake(CGRectGetMinX(frame), CGRectGetMaxY(frame));
    
//    CGPoint MidXMidYPoint = CGPointMake(CGRectGetMidX(frame), CGRectGetMidY(frame));
//    CGPoint MidXTopYPoint = CGPointMake(CGRectGetMidX(frame), CGRectGetMinY(frame));
//    CGPoint MidXBottomYPoint = CGPointMake(CGRectGetMidX(frame), CGRectGetMaxY(frame));
    
//    CGPoint RightXMidYPoint = CGPointMake(CGRectGetMaxX(frame), CGRectGetMidY(frame));
//    CGPoint RightXTopYPoint = CGPointMake(CGRectGetMaxX(frame), CGRectGetMinY(frame));
    CGPoint RightXBottomYPoint = CGPointMake(CGRectGetMaxX(frame), CGRectGetMaxY(frame));
    
    [path appendPath:[UIBezierPath bezierPathWithArcCenter:CGPointMake(leftBottomYPoint.x + CKBracketRadius, leftBottomYPoint.y - CKBracketRadius) radius:CKBracketRadius startAngle:M_PI endAngle:M_PI_2 clockwise:NO]];
    
    [path moveToPoint:CGPointMake(leftBottomYPoint.x + CKBracketRadius, leftBottomYPoint.y)];
    [path addLineToPoint:CGPointMake(RightXBottomYPoint.x - CKBracketRadius, RightXBottomYPoint.y)];
    
    [path appendPath:[UIBezierPath bezierPathWithArcCenter:CGPointMake(RightXBottomYPoint.x - CKBracketRadius, RightXBottomYPoint.y - CKBracketRadius) radius:CKBracketRadius startAngle:M_PI_2 endAngle:0 clockwise:NO]];

    [path stroke];
    
//    self.backgroundColor = [UIColor redColor];
//    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
//    UIBezierPath *maskPath = [UIBezierPath bezierPath];
//    maskPath.lineWidth = 3.f;
//    
//    CGRect frame = self.bounds;
//    
//    switch (self.action.direction) {
//        case CKPageActionDirectionLeft:
//            break;
//        case CKPageActionDirectionRight:
//            break;
//        case CKPageActionDirectionUp:
//            break;
//        case CKPageActionDirectionDown:
//        default:
//        {
//            
//            break;
//        }
//    }
//    
//    CGPoint leftMidYPoint = CGPointMake(0, CGRectGetMidY(frame));
//    [maskPath moveToPoint:leftMidYPoint];
//    [maskPath addArcWithCenter:CGPointMake(leftMidYPoint.x - CKBracketRadius, leftMidYPoint.y) radius:CKBracketRadius startAngle:2 * M_PI endAngle:0 clockwise:YES];
////    [maskPath addLineToPoint:CGPointMake(frame.size.width, CGRectGetMidY(frame))];
////    [maskPath closePath];
//    
//    maskLayer.path = maskPath.CGPath;
//    self.layer.mask = maskLayer;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
//- (void)drawRect:(CGRect)rect {
//    // Drawing code
//    [self handleBracket];
//}


@end
