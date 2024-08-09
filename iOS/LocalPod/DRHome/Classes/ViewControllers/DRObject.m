//
//  DRObject.m
//  DRHome
//
//  Created by qiaole on 2024/8/6.
//

#import "DRObject.h"

@implementation DRObject


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
@end
