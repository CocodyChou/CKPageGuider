//
//  CKPageGuiderScene.m
//  CKPageGuider
//
//  Created by 仇弘扬 on 16/3/16.
//  Copyright © 2016年 仇弘扬. All rights reserved.
//

#import "CKPageScene.h"
#import "CKPageSceneView.h"

@interface CKPageScene ()

@property (nonatomic, strong) NSMutableArray<CKPageAction *> *pageActions;
@property (nonatomic, weak) CKPageSceneView *sceneView;

@end

@implementation CKPageScene

- (void)showInView:(UIView *)view
{
    CKPageSceneView *sceneView = [[CKPageSceneView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    sceneView.scene = self;
    self.sceneView = sceneView;
    
    [self handleActionViewLayout];
    
    [view addSubview:sceneView];
}

- (void)handleActionViewLayout
{
    for (CKPageAction *action in self.actions) {
//        if ([action isKindOfClass:[CKNormalAction class]]) {
//            
//            CKNormalAction *normalAction = (CKNormalAction *)action;
//            [normalAction showInView:self.sceneView];
//            
//        }
        [action showInView:self.sceneView];
    }
}

- (void)hide:(void(^)())finish
{
    void(^finishBlock)() = ^() {
        [self.pageActions removeAllObjects];
        if (finish) {
            finish();
        }
    };
    if (self.sceneView) {
        [self.sceneView hide:^{
            finishBlock();
        }];
    }
    else
    {
        finishBlock();
    }
}

- (void)addAction:(CKPageAction *)action
{
    if (!action) {
        return;
    }
    [self.pageActions addObject:action];
}
- (void)removeAction:(CKPageAction *)action
{
    if (!action) {
        return;
    }
    [self.pageActions removeObject:action];
}

- (NSMutableArray<CKPageAction *> *)pageActions
{
    if (!_pageActions) {
        _pageActions = [NSMutableArray array];
    }
    return _pageActions;
}

- (NSArray<CKPageAction *> *)actions
{
    return [_pageActions copy];
}

- (void)dealloc
{
    [self.pageActions removeAllObjects];
}

@end
