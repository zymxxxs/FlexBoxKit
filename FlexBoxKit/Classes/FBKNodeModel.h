//
//  FBKNodeModel.h
//  FlexBoxKit
//
//  Created by zym on 2018/12/16.
//

#import <Foundation/Foundation.h>

@class FBKLayoutModel;


NS_ASSUME_NONNULL_BEGIN

@interface FBKNodeModel : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *className;
@property (nonatomic, strong) NSArray<FBKLayoutModel *> *layouts;
@property (nonatomic, strong) NSArray<FBKNodeModel *> *children;

@end

NS_ASSUME_NONNULL_END



NS_ASSUME_NONNULL_BEGIN

@interface FBKLayoutModel : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *value;

@end

NS_ASSUME_NONNULL_END



