//
//  NSBundle+I18N.m
//  InternationalizationDemo
//
//  Created by 周荣水 on 2017/9/11.
//  Copyright © 2017年 周荣水. All rights reserved.
//

#import "NSBundle+I18N.h"
#import <objc/runtime.h>


static const NSString *bundleKey = @"bundleKey";

@interface BundleEx : NSBundle

@end

@implementation BundleEx

- (NSString *)localizedStringForKey:(NSString *)key value:(NSString *)value table:(NSString *)tableName {
    NSBundle *bundle = objc_getAssociatedObject(self, &bundleKey);
    return bundle ? [bundle localizedStringForKey:key value:value table:tableName] : [super localizedStringForKey:key value:value table:tableName];
}

@end


@implementation NSBundle (I18N)

+ (void)setMainBundelLanguage:(NSString *)language {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        object_setClass([NSBundle mainBundle], [BundleEx class]);
    });
    //设置关联
    objc_setAssociatedObject([NSBundle mainBundle], &bundleKey, language ? [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:language ofType:@"lproj"]] : nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+ (NSBundle *)getCurrentMainBundel {
    NSString * currentLanguage = [[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"][0];
    NSString *path = [[ NSBundle mainBundle ] pathForResource:currentLanguage ofType:@"lproj" ];
    NSBundle * current = [NSBundle bundleWithPath:path];
    return current;
}


@end
