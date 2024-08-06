//
//  DRHomeViewController.m
//  DRHome
//
//  Created by qiaole on 2024/6/3.
//

#import "DRHomeViewController.h"
#import <Masonry/Masonry.h>
#import "DRObject.h"
@interface DRHomeViewController ()

@end

@implementation DRHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectZero];
    [self.view addSubview:label];
    label.text = @"双色球";
    label.textColor = [UIColor grayColor];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.view).offset(15);
        make.top.equalTo(self.view).offset(20);
    }];
    
    [self test1];
    // Do any additional setup after loading the view.
}

/// 类和对象
/// OC对象的本质: 包含isa指针的结构体  isa指针指向类对象的地址
/// 对象方法存放在类对象的内存中,这么设计的目的是节省内存,符合面向对象的设计理念
/// 类方法也存放在类对象的类方法列表中,类方法的好处:效率更高 节省内存 无需创建对象
/// 类的加载时机 程序启动时所有类和分类都会加载到内存中,加载完成会执行+load方法 执行顺序是先父类再子类在分类
/// 类的initialize 方法是在类第一次使用时调用  分类方法会覆盖本来的实现
/// 对象实际上是含有isa指针的结构体 isa指针指向类对象


/// 消息转发机制
/// OC方法


/// 内存管理
///
///

/// arc原理
///  编译阶段 编译器自动把retain 和 release 代码加入业务代码中
///  释放时机也是引用计数清零时内存销毁,对象内存没有强指针指向时会销毁
///  对象指针在栈中,在超出作用域时会清空,指向的对象内存引用计数减一
///

///  循环引用
///  两个对象互相被强指针引用  使用weak指针
///
///

///   copy 和  strong 的区别
///    strong是浅拷贝 copy是深拷贝 

///   如何监控工程内存泄露

///    __weak 的原理
///   hash 表存储 key未对象的内存地址 value为指向对象的弱指针数组 当对象销毁执行dealloc时 会清空weak指针 再给空指针发送消息不会崩溃,比较安全
///   __unsafe__unretain  不会情况指针,在调用时会异常,不安全

/// runloop
- (void)test1{
    DRObject * ob1 = [DRObject new];
    DRObject * ob2 = [DRObject new];
    DRObject * ob3 = [DRObject new];
    NSMutableString * a = [[[NSMutableString alloc]initWithString:@"123"] copy];
    ob1.coObject1 = a;
    ob1.strong_ = a;
    ob1.weak_ = a;
    [(NSMutableString*)ob1.weak_ insertString:@"0" atIndex:0];
    ob1.strong_ = @"1";
    NSLog(@"%@ %@ %@ %@",ob1.strong_,ob1.weak_,ob1.coObject1,a);
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
