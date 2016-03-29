//
//  CKNormalActionView.m
//  CKPageGuider
//
//  Created by 仇弘扬 on 16/3/16.
//  Copyright © 2016年 仇弘扬. All rights reserved.
//

#import "CKNormalActionView.h"

@interface CKNormalActionView ()

@property (weak, nonatomic) IBOutlet UIImageView *lineLeft;
@property (weak, nonatomic) IBOutlet UIImageView *lineRight;
@property (weak, nonatomic) IBOutlet UIImageView *lineTop;
@property (weak, nonatomic) IBOutlet UIImageView *lineDown;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *lines;

@property (weak, nonatomic) IBOutlet UIImageView *bracketUp;
@property (weak, nonatomic) IBOutlet UIImageView *bracketLeft;
@property (weak, nonatomic) IBOutlet UIImageView *bracketRight;
@property (weak, nonatomic) IBOutlet UIImageView *bracketDown;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *brackets;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lengthTop;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lengthDown;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lengthLeft;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lengthRight;
@property (strong, nonatomic) IBOutletCollection(NSLayoutConstraint) NSArray *lengths;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *centerXOfLabelView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *centerYOfLabelView;

@property (weak, nonatomic) IBOutlet UILabel *labelOfTip;

@end

@implementation CKNormalActionView

- (void)show
{
    self.labelOfTip.text = self.action.actionTip;
    switch (self.action.direction) {
        case CKPageActionDirectionLeft:
        {
            [self showLine:self.lineRight];
            [self showBracket:self.bracketRight];
            [self updateLenght:self.lengthRight];
            break;
        }
        case CKPageActionDirectionRight:
        {
            [self showLine:self.lineLeft];
            [self showBracket:self.bracketLeft];
            [self updateLenght:self.lengthLeft];
            break;
        }
        case CKPageActionDirectionUp:
        {
            [self showLine:self.lineDown];
            [self showBracket:self.bracketDown];
            [self updateLenght:self.lengthDown];
            break;
        }
        case CKPageActionDirectionDown:
        default:
        {
            [self showLine:self.lineTop];
            [self showBracket:self.bracketUp];
            [self updateLenght:self.lengthTop];
            break;
        }
    }
    [self handleCenterOfLabelView];
}

- (void)handleCenterOfLabelView
{
    CGRect textRect = self.action.actionTipRect;
    CGPoint center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    switch (self.action.direction) {
        case CKPageActionDirectionLeft:
        {
            CGFloat target = CGRectGetWidth(self.bounds) - [self normalAction].lineLength - textRect.size.width / 2 - center.x - 5 - 6;
            self.centerXOfLabelView.constant = target;
            self.centerYOfLabelView.constant += [self normalAction].topOffset;
            break;
        }
        case CKPageActionDirectionRight:
        {
            CGFloat target = CGRectGetWidth(self.bounds) / 2 - ([self normalAction].lineLength + 5 + textRect.size.width / 2 + 6);
            self.centerXOfLabelView.constant = -target;
            self.centerYOfLabelView.constant += [self normalAction].topOffset;
            break;
        }
        case CKPageActionDirectionUp:
        {
            CGFloat target = CGRectGetHeight(self.bounds) - [self normalAction].lineLength - 5 - textRect.size.height / 2 - center.y - 6;
            self.centerYOfLabelView.constant = target;
            self.centerXOfLabelView.constant += [self normalAction].leftOffset;
            break;
        }
        case CKPageActionDirectionDown:
        default:
        {
            CGFloat target = CGRectGetHeight(self.bounds) / 2 - [self normalAction].lineLength - 5 - textRect.size.height / 2 - 6;
            self.centerYOfLabelView.constant = -target;
            self.centerXOfLabelView.constant += [self normalAction].leftOffset;
            break;
        }
    }

}

- (void)updateLenght:(NSLayoutConstraint *)lengthLine
{
    lengthLine.constant = [self normalAction].lineLength;
}

- (void)showLine:(UIImageView *)line
{
    for (UIImageView *l in self.lines) {
        l.hidden = ![line isEqual:l];
    }
}

- (void)showBracket:(UIImageView *)bracket
{
    for (UIImageView *b in self.brackets) {
        b.hidden = ![bracket isEqual:b];
    }
}

- (CKNormalAction *)normalAction
{
    return (CKNormalAction *)self.action;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
