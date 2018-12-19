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

@property (nonatomic, strong) FBKNodeModel *nodeModel;

- (instancetype)initWithNodeModel:(FBKNodeModel *)nodeModel;

- (nullable UIView *)layout;

@end

NS_ASSUME_NONNULL_END
