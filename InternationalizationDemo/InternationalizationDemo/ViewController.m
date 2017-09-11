//
//  ViewController.m
//  InternationalizationDemo
//
//  Created by 周荣水 on 2017/9/11.
//  Copyright © 2017年 周荣水. All rights reserved.
//

#import "ViewController.h"
#import "NSBundle+I18N.h"

@interface ViewController ()
- (IBAction)chineseAction:(id)sender;
- (IBAction)englishAction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *countryLable;
@property (weak, nonatomic) IBOutlet UIImageView *flagImg;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.flagImg.image = [UIImage imageNamed:@"china"];
    //这里如果没有引出控件如下面示例一样的话，可以在storyboard下的.strings文件里制作
    self.countryLable.text = @"中国";
    
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)changeLanguage:(NSString *)language {
    //设置本app语言,注意key一定是@"AppleLanguages"，即使下次启动APP，也是现在设置的这个语言。
    [[NSUserDefaults standardUserDefaults] setObject:@[language] forKey:@"AppleLanguages"];
    
    [NSBundle setMainBundelLanguage:language];
    
    //如果你的storyboard生成的多个语言的.storyboard文件，则获取当前storyboard的bundel如下
    //NSBundle * currentMainBundel = [NSBundle getCurrentMainBundel];
    
    //如果你的storyboard 生成的多个语言的Main.strings文件，则获取当前storyboard的bundel如下
    NSBundle * currentMainBundel = [NSBundle mainBundle];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:currentMainBundel];
    ViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    
    [UIApplication sharedApplication].keyWindow.rootViewController = vc;
    [[UIApplication sharedApplication].keyWindow makeKeyAndVisible];
}


- (IBAction)chineseAction:(id)sender {
    [self changeLanguage:@"zh-Hans"];
}

- (IBAction)englishAction:(id)sender {
    [self changeLanguage:@"en"];
}

@end
