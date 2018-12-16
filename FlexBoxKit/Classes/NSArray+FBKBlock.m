//
//  NSArray+FBKBlock.m
//  FlexBoxKit
//
//  Created by zym on 2018/12/16.
//

#import "NSArray+FBKBlock.h"

@implementation NSArray (FBKBlock)

- (NSArray *)fbk_map:(id (^)(id object))block {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:self.count];
    
    for (id object in self) {
        [array addObject:block(object) ?: [NSNull null]];
    }
    
    return array;
}

- (NSArray *)fbk_filter:(BOOL (^)(id object))block {
    return [self filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
        return block(evaluatedObject);
    }]];
}


@end
