//
//  CKBracketView.h
//  CKPageGuider
//
//  Created by 仇弘扬 on 16/3/17.
//  Copyright © 2016年 仇弘扬. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CKNormalAction.h"

@interface CKBracketView : UIView

@property (nonatomic, weak) CKNormalAction *action;

- (void)handleBracket;

@end
