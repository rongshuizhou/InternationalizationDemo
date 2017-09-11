//
//  NSBundle+I18N.h
//  InternationalizationDemo
//
//  Created by 周荣水 on 2017/9/11.
//  Copyright © 2017年 周荣水. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSBundle (I18N)

+ (void)setMainBundelLanguage:(NSString *)language;

+ (NSBundle *)getCurrentMainBundel;

@end
