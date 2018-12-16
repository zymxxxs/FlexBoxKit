//
//  NSArray+FBKBlock.h
//  FlexBoxKit
//
//  Created by zym on 2018/12/16.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (FBKBlock)

- (NSArray *)fbk_map:(id (^)(id object))block;
- (NSArray *)fbk_filter:(BOOL (^)(id object))block;

@end

NS_ASSUME_NONNULL_END
