//
//  CKPageAction.h
//  CKPageGuider
//
//  Created by 仇弘扬 on 16/3/16.
//  Copyright © 2016年 仇弘扬. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, CKPageActionDirection) {
    CKPageActionDirectionLeft,
    CKPageActionDirectionRight,
    CKPageActionDirectionUp,
    CKPageActionDirectionDown
};

@interface CKPageAction : NSObject

@property (nonatomic, strong) NSString *actionTip;

@property (nonatomic, assign) CKPageActionDirection direction;

@property (nonatomic, assign) CGRect actionTipRect;

- (void)showInView:(UIView *)superView;

@end
