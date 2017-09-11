//
//  UILabel+I18N.m
//  InternationalizationDemo
//
//  Created by 周荣水 on 2017/9/11.
//  Copyright © 2017年 周荣水. All rights reserved.
//

#import "UILabel+I18N.h"
#import <objc/runtime.h>

@implementation UILabel (I18N)

+(void)load {
    SEL originalSelector = @selector(setText:);
    SEL swizzledSelector = @selector(swizzled_setText:);
    Method originMehtod = class_getInstanceMethod([self class], @selector(setText:));
    Method otherMehtod = class_getInstanceMethod([self class], @selector(swizzled_setText:));
    BOOL didAddMethod =
    class_addMethod(self,
                    originalSelector,
                    method_getImplementation(otherMehtod),
                    method_getTypeEncoding(otherMehtod));
    if (didAddMethod) {
        class_replaceMethod(self,
                            swizzledSelector,
                            method_getImplementation(originMehtod),
                            method_getTypeEncoding(originMehtod));
    }
    else {
        // 交换2个方法的实现
        method_exchangeImplementations(otherMehtod, originMehtod);
    }
}

- (void)swizzled_setText:(NSString *)string {
    [self swizzled_setText:NSLocalizedString(string, nil)];
}

@end
