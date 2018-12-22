//
//  FBKRootView.m
//  FlexBoxKit
//
//  Created by zym on 2018/12/22.
//

#import "FBKRootView.h"

#import "FBKNodeLayout.h"
#import "FBKNodeModel.h"
#import "FBKXMLParser.h"

#import <YogaKit/UIView+Yoga.h>

@implementation FBKRootView {
    FBKXMLParser *_xmlParser;
    FBKNodeModel *_nodeModel;
    UIView *_contentView;
}

- (instancetype)initWithXMLPath:(NSString *)xmlPath {
    self = [super initWithFrame:CGRectZero];
    if (self) {
        _xmlParser = [[FBKXMLParser alloc] init];
        _nodeModel = [_xmlParser parseWithXMLPath:xmlPath];
        _contentView = [FBKNodeLayout layoutWithNodeModel:_nodeModel];
        [self addSubview:_contentView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _contentView.frame = self.bounds;
    [_contentView.yoga applyLayoutPreservingOrigin:true];
}

@end
