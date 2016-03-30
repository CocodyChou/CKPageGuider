//
//  CKPageGuiderHelper.m
//  CKPageGuider
//
//  Created by 仇弘扬 on 16/3/16.
//  Copyright © 2016年 仇弘扬. All rights reserved.
//

#import "CKPageGuiderHelper.h"

@implementation CKPageGuiderHelper

+ (instancetype)helper
{
    static CKPageGuiderHelper *helper = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        helper = [CKPageGuiderHelper new];
    });
    return helper;
}

+ (BOOL)shouldShowPageGuiderForIdentifier:(NSString *)identifier
{
#if DEBUG
//    return YES;
#endif
    if (!identifier) {
        return NO;
    }
    return ![[NSUserDefaults standardUserDefaults] boolForKey:identifier];
}

+ (void)endGuideForIdentifier:(NSString *)identifier
{
    if (identifier) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:identifier];
    }
}

+ (void)clearDataForIdentifier:(NSString *)identifier
{
    if (!identifier) {
        return;
    }
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:identifier];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
