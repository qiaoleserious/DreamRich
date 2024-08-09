//
//  DRObject+runTest.m
//  DRHome
//
//  Created by qiaole on 2024/8/9.
//

#import "DRObject+runTest.h"

@implementation DRObject (runTest)
+ (void)runTest1{
    [self Test2];
    NSLog(@"%@",self);
    NSLog(@"%@",[self class]);
}
@end
