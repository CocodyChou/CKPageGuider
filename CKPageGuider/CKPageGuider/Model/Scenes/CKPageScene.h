//
//  CKPageGuiderScene.h
//  CKPageGuider
//
//  Created by 仇弘扬 on 16/3/16.
//  Copyright © 2016年 仇弘扬. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CKPageAction.h"
#import "CKNormalActionView.h"
#import "CKToastActionView.h"

@interface CKPageScene : UIView

- (NSArray<CKPageAction *> *)actions;

- (void)addAction:(CKPageAction *)action;
- (void)removeAction:(CKPageAction *)action;

- (void)showInView:(UIView *)view;
- (void)hide:(void(^)())finish;

@end
