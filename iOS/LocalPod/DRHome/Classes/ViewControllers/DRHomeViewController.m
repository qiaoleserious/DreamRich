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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
