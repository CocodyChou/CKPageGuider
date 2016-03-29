//
//  CKNormalAction.h
//  CKPageGuider
//
//  Created by 仇弘扬 on 16/3/16.
//  Copyright © 2016年 仇弘扬. All rights reserved.
//

#import "CKPageAction.h"

@interface CKNormalAction : CKPageAction

@property (nonatomic, assign) NSUInteger lineLength;
@property (nonatomic, assign) CGFloat cornerRadius;
@property (nonatomic, assign) UIEdgeInsets margin;
@property (nonatomic, assign) CGFloat leftOffset;
@property (nonatomic, assign) CGFloat topOffset;

- (CGRect)actionFocusRect;
- (CGFloat)finalCornerRadius;

+ (instancetype)actionWithFocusView:(UIView *)view direction:(CKPageActionDirection)direction description:(NSString *)description;
+ (instancetype)actionWithFocusRect:(CGRect)rect direction:(CKPageActionDirection)direction description:(NSString *)description;

@end
