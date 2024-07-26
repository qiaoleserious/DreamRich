//
//  DRHomeViewController.m
//  DRHome
//
//  Created by qiaole on 2024/6/3.
//

#import "DRHomeViewController.h"
#import <Masonry/Masonry.h>
@interface DRHomeViewController ()

@end

@implementation DRHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectZero];
    [self.view addSubview:label];
    label.text = @"双色球";
    label.textColor = [UIColor grayColor];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.view).offset(15);
        make.top.equalTo(self.view).offset(20);
    }];
    
    // Do any additional setup after loading the view.
}

/// 类和对象
/// OC对象的本质: 包含isa指针的结构体  isa指针指向类对象的地址
/// 对象方法存放在类对象的内存中,这么设计的目的是节省内存,符合面向对象的设计理念
/// 类方法存放在哪里
/// 类的加载时机
/// 消息转发机制
- (void)test1{
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
