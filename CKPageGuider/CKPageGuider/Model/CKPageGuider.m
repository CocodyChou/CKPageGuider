//
//  CKPageGuider.m
//  CKPageGuider
//
//  Created by 仇弘扬 on 16/3/16.
//  Copyright © 2016年 仇弘扬. All rights reserved.
//

#import "CKPageGuider.h"
#import "CKPageGuiderView.h"
#import "CKPageGuiderHelper.h"

@interface CKPageGuider ()

@property (nonatomic, strong) NSMutableArray<CKPageScene *> *pageScenes;

@property (nonatomic, weak) CKPageScene *currentScene;

@property (nonatomic, weak) CKPageGuiderView *guiderView;

@property (nonatomic, copy) NSString *identifier;

@end

@implementation CKPageGuider

+ (instancetype)guiderWithIdentifier:(NSString *)identifier oldIdentifier:(NSString *)oldIdentifier
{
    CKPageGuider *guider = [CKPageGuider new];
    guider.identifier = identifier;
    [CKPageGuiderHelper clearDataForIdentifier:oldIdentifier];
    return guider;
}

- (void)addScene:(CKPageScene *)scene
{
    if (!scene) {
        return;
    }
    [self.pageScenes addObject:scene];
}
- (void)removeScene:(CKPageScene *)scene
{
    if (!scene) {
        return;
    }
    [self.pageScenes removeObject:scene];
}

- (CKPageScene *)firstScene
{
    return self.pageScenes.firstObject;
}

- (CKPageScene *)lastScene
{
    return self.pageScenes.lastObject;
}

- (CKPageScene *)nextScene
{
    if (!self.currentScene) {
        self.currentScene = [self firstScene];
    }
    if ([self.currentScene isEqual:[self lastScene]]) {
        return nil;
    }
    return [self.pageScenes objectAtIndex:[self.pageScenes indexOfObject:self.currentScene] + 1];
}

- (void)show
{
    if (![CKPageGuiderHelper shouldShowPageGuiderForIdentifier:self.identifier]) {
        return;
    }
    CKPageScene *scene = [self firstScene];
    if (scene) {
        CKPageGuiderView *guiderView = [[CKPageGuiderView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        
        [[UIApplication sharedApplication].keyWindow addSubview:guiderView];
        [CKPageGuiderHelper helper].currentGuider = self;
        guiderView.guider = self;
        
        self.guiderView = guiderView;
        [self showScene:scene];
    }
}

- (void)showScene:(CKPageScene *)scene
{
    if (scene) {
        self.currentScene = scene;
        [scene showInView:self.guiderView];
    }
}

- (void)hide
{
    [self.guiderView removeFromSuperview];
    [CKPageGuiderHelper endGuideForIdentifier:self.identifier];
    for (int i = 0; i < self.guiderView.subviews.count; i++) {
        [self.guiderView.subviews.lastObject removeFromSuperview];
    }
}

- (void)next
{
    if ([self hasNext]) {
        [self.currentScene hide:^{
            self.currentScene = [self nextScene];
            [self.currentScene showInView:self.guiderView];
        }];
    }
    else
    {
        [self.currentScene hide:^{
            [self hide];
        }];
    }
}

- (BOOL)hasNext
{
    if (self.currentScene) {
        NSInteger currentIndex = [self.pageScenes indexOfObject:self.currentScene];
        return currentIndex < self.pageScenes.count - 1;
    }
    return NO;
}

- (NSMutableArray<CKPageScene *> *)pageScenes
{
    if (!_pageScenes) {
        _pageScenes = [NSMutableArray array];
    }
    return _pageScenes;
}

@end
