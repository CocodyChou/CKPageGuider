//
//  CKPageGuiderHelper.h
//  CKPageGuider
//
//  Created by 仇弘扬 on 16/3/16.
//  Copyright © 2016年 仇弘扬. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CKPageGuider.h"

@interface CKPageGuiderHelper : NSObject

@property (nonatomic, strong) CKPageGuider *currentGuider;

+ (instancetype)helper;

+ (BOOL)shouldShowPageGuiderForIdentifier:(NSString *)identifier;
+ (void)endGuideForIdentifier:(NSString *)identifier;

+ (void)clearDataForIdentifier:(NSString *)identifier;

@end
