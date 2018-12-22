//
//  FBKNodeLayout.h
//  FlexBoxKit
//
//  Created by zym on 2018/12/16.
//

#import <Foundation/Foundation.h>
#import "FBKNodeModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FBKNodeLayout : NSObject

+ (nullable UIView *)layoutWithNodeModel:(FBKNodeModel *)nodeModel;

@end

NS_ASSUME_NONNULL_END
