//
//  CKPageGuider.h
//  CKPageGuider
//
//  Created by 仇弘扬 on 16/3/16.
//  Copyright © 2016年 仇弘扬. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CKPageScene.h"

@interface CKPageGuider : NSObject

/**
 *  @author 仇弘扬, 16-03-17 17:03:53
 *
 *  生成一个引导，使用新旧两个 identifier 来判断是否要显示这个引导，以及清除 oldIdentifier 相关数据，避免多次生成导致存储的数据过多
 *
 *  @param identifier    新的 identifier
 *  @param oldIdentifier 旧的 oldIdentifier，没有传 nil
 *
 *  @return 引导
 */
+ (instancetype)guiderWithIdentifier:(NSString *)identifier oldIdentifier:(NSString *)oldIdentifier;

- (void)addScene:(CKPageScene *)scene;
- (void)removeScene:(CKPageScene *)scene;

- (void)show;
- (void)hide;

- (void)next;

@end
