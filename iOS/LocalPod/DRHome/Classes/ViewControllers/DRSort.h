//
//  DRSort.h
//  DRHome
//
//  Created by qiaole on 2024/9/3.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSUInteger, SortType) {
    SortType_MP,
    SortType_XZ,
    SortType_KS,
    SortType_CR,
    SortType_DU,
};

@interface DRSort : NSObject
+ (void)SortType:(SortType)type oriData:(NSArray*)data;
@end

NS_ASSUME_NONNULL_END
