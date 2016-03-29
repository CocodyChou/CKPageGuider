//
//  CKPageGuiderActionView.h
//  CKPageGuider
//
//  Created by 仇弘扬 on 16/3/16.
//  Copyright © 2016年 仇弘扬. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CKPageAction.h"

@interface CKPageActionView : UIView

@property (nonatomic, strong) CKPageAction *action;

- (void)show;

@end
