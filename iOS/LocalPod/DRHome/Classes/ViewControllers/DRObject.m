//
//  DRObject.m
//  DRHome
//
//  Created by qiaole on 2024/8/6.
//

#import "DRObject.h"
#import <objc/runtime.h>
#import "DRSubObject.h"
@interface DRObject ()
@property (nonatomic,assign)NSInteger qqq;
@end



//快手 阿里 大华 吉利 网易 乐橙 宇视
@implementation DRObject

- (void)thread{
    int i = 1;
    ++i;
    _qqq ++;
    NSLog(@"%@",[NSThread currentThread]);
    //NSLog(@"%d",_qqq);
    NSLog(@"%d",i);
}


- (void)test{
    _age = 10;
}

+ (void)Test1
{
    [self Test2];
    NSLog(@"%s",__func__);
    [[self class] Test2];
    NSLog(@"%s",__func__);
}

+ (void)Test2{
    NSLog(@"%s",__func__);
}


- (void)dealloc{
    NSLog(@"DRObject dealloc");
    NSLog(@"%@",self);
}

+ (BOOL)automaticallyNotifiesObserversOfAge{
    return false;
}

void objcImp(id self,SEL _cmd){
    NSLog(@"hello");
}

+ (BOOL)resolveInstanceMethod:(SEL)sel
{
    return [super resolveInstanceMethod:sel];
}

- (id)forwardingTargetForSelector:(SEL)aSelector
{
    if ([DRSubObject respondsToSelector:aSelector]) {
        return [[DRSubObject alloc] init];
    }
    return  [super forwardingTargetForSelector:aSelector];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    NSLog(@"methodSignatureForSelector");
    NSMethodSignature *signature = [NSMethodSignature signatureWithObjCTypes:"v@:"];
    return signature;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    NSLog(@"forwardInvocation");
    NSLog(@"%@",anInvocation.target);
}

@end
