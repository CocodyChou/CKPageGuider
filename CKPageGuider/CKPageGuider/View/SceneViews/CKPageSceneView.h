//
//  CKPageSceneView.h
//  CKPageGuider
//
//  Created by 仇弘扬 on 16/3/16.
//  Copyright © 2016年 仇弘扬. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CKPageScene.h"

@interface CKPageSceneView : UIView

@property (nonatomic, weak) CKPageScene *scene;

- (void)show;
- (void)hide:(void(^)())finish;

@end
