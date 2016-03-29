//
//  CKToastAction.h
//  CKPageGuider
//
//  Created by 仇弘扬 on 16/3/16.
//  Copyright © 2016年 仇弘扬. All rights reserved.
//

#import "CKPageAction.h"

@interface CKToastAction : CKPageAction

@property (nonatomic, strong) UIImage *image;
@property (nonatomic, assign) CGPoint center;

+ (instancetype)actionWithImage:(UIImage *)image description:(NSString *)description center:(CGPoint)center;

@end
