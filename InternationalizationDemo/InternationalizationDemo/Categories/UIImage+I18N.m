//
//  UIImage+I18N.m
//  InternationalizationDemo
//
//  Created by 周荣水 on 2017/9/11.
//  Copyright © 2017年 周荣水. All rights reserved.
//

#import "UIImage+I18N.h"
#import <objc/runtime.h>

@implementation UIImage (I18N)

+(void)load {
    Method otherMehtod = class_getClassMethod(self, @selector(swizzled_imageNamed:));
    Method originMehtod = class_getClassMethod(self, @selector(imageNamed:));
    // 交换2个方法的实现
    method_exchangeImplementations(otherMehtod, originMehtod);
}

+ (UIImage *)swizzled_imageNamed:(NSString *)name {
    return [self swizzled_imageNamed:NSLocalizedString(name, nil)];
}

@end
