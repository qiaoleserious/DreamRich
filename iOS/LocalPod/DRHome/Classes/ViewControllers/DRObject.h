//
//  DRObject.h
//  DRHome
//
//  Created by qiaole on 2024/8/6.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DRObject : NSObject
@property (nonatomic,strong)DRObject * strong_;
@property (nonatomic,weak)DRObject * weak_;
@property (nonatomic,copy)NSArray* coObject1;

+ (void)Test1;
+ (void)Test2;
@end

NS_ASSUME_NONNULL_END
