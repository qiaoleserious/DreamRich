//
//  DRHomeViewController.m
//  DRHome
//
//  Created by qiaole on 2024/6/3.
//

#import "DRHomeViewController.h"
#import <Masonry/Masonry.h>
#import "DRObject.h"
#import "DRObject+runTest.h"
#import <objc/runtime.h>
#import "ReactiveObjC/ReactiveObjC.h"
#import <objc/message.h>
#import "DRSubObject.h"
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
    /// 类方法存放meta类对象的类方法列表中,类方法的好处:效率更高 节省内存 无需创建对象
/// 类的加载时机 程序启动时所有类和分类都会加载到内存中,加载完成会执行+load方法 执行顺序是先父类再子类在分类
/// 类的initialize 方法是在类第一次使用时调用  分类方法会覆盖本来的实现


/// 对象实际上是含有isa指针的结构体 isa指针指向类对象
/// 类对象存储这 isa 指针 指向元类对象的地址  superclass指针指向父类对象
///  cache_methodList  散列表结构 存储调用过得方法 节省方法查找效率
///  对象方法列表和分类方法列表



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
///  __block
///    block也是一个含有isa指针的结构体,捕获上下文环境
///    __block会把栈中的值拷贝到堆中,可以改变
///    __block 用copy修饰 每一个对象都持有一个单独的block

///   copy 和  strong 的区别
///    strong是浅拷贝 copy是深拷贝 
///    copy 和 mutabalecopy 只有mutablecopy 出来的是可变数组

///   如何监控工程内存泄露

///    __weak 的原理
///   hash 表存储 key未对象的内存地址 value为指向对象的弱指针数组 当对象销毁执行dealloc时 会清空weak指针 再给空指针发送消息不会崩溃,比较安全
///   __unsafe__unretain  不会情况指针,在调用时会异常,不安全

/// kvc kvo
///  kvc 可以给对象的内部属性和readonly属性赋值
/// kvo 属性监听
///  把一个对象的属性添加监听后,runtime会动态创建一个当前类的子类并让当前对象的isa指针指向新创建的类,
///  替换属性的set方法,增加 willchangeValueForkey 和 didchangeValueforkey
///  

/// 消息转发机制
///  分三步 1,方法查找 2,方法解析 3消息转发
///  1,对象方法调用 通过isa指针找到类对象,查找缓存list --> 查找对象方法列表  -->父类对象缓存 --> 父类对象方法列表
///    类方法调用 通过isa指针找到元类对象,查找缓存list --> 查找类方法列表  -->父元类对象缓存 --> 父元类对象类方法列表
///  2,触发类方法  resolveInstanceMethod  resolveClassMethod  后再次遍历方法查找
///   如果有动态方法添加成功,没添加就进入消息转发流程
///  3消息转发
///    如果前两个步骤没成功会进行消息转发,
///    快速转发 : forwardingTargetForSelector  指定其他对象接受这个消息
///    慢转发: methodSignatureForSelector 生成一个方法签名 调用forwardInvocation 处理


/// runloop
///


/// https 和 http 的区别   HTTPS多了一层ssl协议
/// 服务器像三方机构申请证书生成一份公钥和私钥,
/// 客户端请求公钥并验证公钥合法性,然后使用对称加密对明文加密
- (void)test1{
    DRObject * ob1 = [DRObject new];
    DRObject * ob2 = [DRObject new];
    DRObject * ob3 = [DRObject new];
    
    ob1.strong_ = ob2;
    ob2.strong_ = ob1;
    ob1 = nil;
    ob2 = nil;
  
    [ob3 performSelector:@selector(abc)];
    DRSubObject *Sub = [[DRSubObject alloc] init];
   
}

- (void)blockTest{
    
//    @autoreleasepool {
//        __block int a = 40;
//        NSMutableArray * marr = [[NSMutableArray alloc]initWithArray:@[@1,@1]];
//        __block NSArray * arr = @[@2,@2];
//        a --;
//        void (^testblock)() = ^{
//            [marr insertObject:@1 atIndex:0];
//            NSLog(@"%d",a);
//            a ++;
//            arr = @[@1234];
//        };
//        testblock();
//        NSLog(@"%d",marr.count);
//        testblock();
//        testblock();
//        testblock();
//    }
//    

    DRObject * a = [[DRObject alloc]init];
    [a addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    [a test];
    a.age = 4;
    [a setValue:@1 forKey:@"age"];
    NSLog(@"%d",a.age);
    
    [a performSelector:@selector(abc1)];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    NSLog(@"1231231");
    NSLog(@"%@   %@   %@",object,keyPath,change);
}


- (void)theadTest{
    NSLog(@"1");
    
    NSLog(@"2");
    NSLog(@"3");
    NSLog(@"4");
    NSLog(@"5");
    
}

- (void)runLoopTest{
    [NSRunLoop currentRunLoop];
}

@end
