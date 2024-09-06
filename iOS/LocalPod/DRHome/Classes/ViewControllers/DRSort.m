//
//  DRSort.m
//  DRHome
//
//  Created by qiaole on 2024/9/3.
//

#import "DRSort.h"

@implementation DRSort

+ (void)SortType:(SortType)type oriData:(NSArray *)data
{
    switch (type) {
        case SortType_MP:
            [self maopaoSort:data];
            break;
        case SortType_KS:
            [self kuaisuSort:data];
            break;
        case SortType_XZ:
            [self xuanzeSort:data];
            break;
        case SortType_CR:
            [self charuSort:data];
            break;
        case SortType_DU:
            [self duiSort:data];
            break;
            
        default:
            break;
    }
}

/// 冒泡排序
/// 前后比较 两两交换
+ (void)maopaoSort:(NSArray*)data {
    NSMutableArray * tmp = [data mutableCopy];
    int cou = 0;
    for (int i = 0 ; i < tmp.count; i++) {
        BOOL flag = NO;
        for (int j = 0; j < tmp.count - 1 -i; j ++ ) {
            if ([tmp[j] intValue] > [tmp[j+1] intValue]) {
                flag = YES;
                [tmp exchangeObjectAtIndex:j withObjectAtIndex:j+1];
            }
            cou ++;
        }
        if (!flag) {
            break;
        }
    }
    NSLog(@"%s",__func__);
    NSLog(@"%@",tmp);
    NSLog(@"%d 次数",cou);
}

/// 选择排序
/// 选出最小的放在第一个位置上
+ (void)xuanzeSort:(NSArray*)data {
    NSMutableArray * tmp = [data mutableCopy];
    int cou = 0;
    for (int i = 0 ; i < tmp.count; i++) {
        for (int j = i+1; j < tmp.count; j ++ ) {
            if ([tmp[i] intValue] > [tmp[j] intValue]) {
                [tmp exchangeObjectAtIndex:i withObjectAtIndex:j];
            }
            cou ++;
        }
    }
    NSLog(@"%s",__func__);
    NSLog(@"%@",tmp);
    NSLog(@"%d 次数",cou);
}

/// 插入排序
///
+ (void)charuSort:(NSArray*)data {
    NSMutableArray * tmp = [data mutableCopy];
    int cou = 0;
    for (int i = 1 ; i < tmp.count ; i++) {
        int tmpV = [tmp[i] intValue];
        int k = i -1;
        while (k >=0 ) {
            if (<#condition#>) {
                <#statements#>
            }
            k --;
        }
    }
    NSLog(@"%s",__func__);
    NSLog(@"%@",tmp);
    NSLog(@"%d 次数",cou);
}

/// 快速排序
///
+ (void)kuaisuSort:(NSArray*)data {
    NSMutableArray * tmp = [data mutableCopy];
    int cou = 0;
    for (int i = 0 ; i < tmp.count; i++) {
        for (int j = i+1; j < tmp.count; j ++ ) {
            if ([tmp[i] intValue] > [tmp[j] intValue]) {
                [tmp exchangeObjectAtIndex:i withObjectAtIndex:j];
            }
            cou ++;
        }
    }
    NSLog(@"%s",__func__);
    NSLog(@"%@",tmp);
    NSLog(@"%d 次数",cou);
}

/// 堆排序
///
+ (void)duiSort:(NSArray*)data {
    NSMutableArray * tmp = [data mutableCopy];
    int cou = 0;
    for (int i = 0 ; i < tmp.count; i++) {
        for (int j = i+1; j < tmp.count; j ++ ) {
            if ([tmp[i] intValue] > [tmp[j] intValue]) {
                [tmp exchangeObjectAtIndex:i withObjectAtIndex:j];
            }
            cou ++;
        }
    }
    NSLog(@"%s",__func__);
    NSLog(@"%@",tmp);
    NSLog(@"%d 次数",cou);
}
@end
