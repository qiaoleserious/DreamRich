//
//  DRObject.m
//  DRHome
//
//  Created by qiaole on 2024/8/6.
//

#import "DRObject.h"
#import <objc/runtime.h>
@interface DRObject ()
//@property (nonatomic,assign,readonly)NSInteger age;
@end




@implementation DRObject
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
    
}

+ (BOOL)resolveInstanceMethod:(SEL)sel
{
    if (sel == @selector(abc)) {
        class_addMethod(self, @selector(abc), (IMP)objcImp, @"v@");
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}

+ (BOOL)resolveClassMethod:(SEL)sel
{
    return YES;
}
@end
