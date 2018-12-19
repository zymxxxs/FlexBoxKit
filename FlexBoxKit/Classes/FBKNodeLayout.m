//
//  FBKNodeLayout.m
//  FlexBoxKit
//
//  Created by zym on 2018/12/16.
//

#import "FBKNodeLayout.h"
#import "FBKYogaUtilities.h"

#import <YogaKit/YGLayout.h>
#import <YogaKit/UIView+Yoga.h>

@implementation FBKNodeLayout

- (instancetype)initWithNodeModel:(FBKNodeModel *)nodeModel
{
    self = [super init];
    if (self) {
        self.nodeModel = nodeModel;
    }
    return self;
}


- (UIView *)layout {
    UIView *rootView = [[UIView alloc] init];
    NSString *className = _nodeModel.className;
    
    if (!className) return nil;
    
    Class cls = NSClassFromString(className);
    if (!cls) {
        NSLog(@"FlexBoxKit: class %@ is not found.", className);
        return nil;
    }
    
    UIView *nodeView = [[cls alloc] init];
    [rootView addSubview:nodeView];
    
    [rootView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        for (FBKLayoutModel *layoutModel in self.nodeModel.layouts) {
            FBKSetLayoutParam(layout, layoutModel.name, layoutModel.value);
        }
    }];
    return rootView;
}

static YGValue FBKTransformYGValue(NSString *value) {
    if ([value isEqualToString:@"none"]) return YGValueUndefined;
    
    if ([value isEqualToString:@"auto"]) return YGValueAuto;
    
    return YGPointValue([value doubleValue]);
}

static void FBKSetLayoutParam(YGLayout *layout, NSString *key, NSString *value) {
#define FBK_SET_YG_ENUM_VALUE(prop, table, type) \
if ([key isEqualToString:@(#prop)]) { \
layout.prop = (type)[table[value] intValue]; \
return; \
} \

    
#define FBK_SET_YG_VALUE(prop) \
if ([key isEqualToString:@(#prop)]) { \
layout.prop = FBKTransformYGValue(value); \
return; \
} \

#define FBK_SET_YG_CGFloat_VALUE(prop) \
if ([key isEqualToString:@(#prop)]) { \
layout.prop = [value doubleValue]; \
return; \
} \

    FBK_SET_YG_ENUM_VALUE(direction, FBKYgDirection(), YGDirection);
    FBK_SET_YG_ENUM_VALUE(flexDirection, FBKYgFlexDirection(), YGFlexDirection);
    FBK_SET_YG_ENUM_VALUE(justifyContent, FBKYgJustify(), YGJustify);
    FBK_SET_YG_ENUM_VALUE(alignContent, FBKYgAlign(), YGAlign);
    FBK_SET_YG_ENUM_VALUE(alignItems, FBKYgAlign(), YGAlign);
    FBK_SET_YG_ENUM_VALUE(alignSelf, FBKYgAlign(), YGAlign);
    FBK_SET_YG_ENUM_VALUE(position, FBKYgPositionType(), YGPositionType);
    FBK_SET_YG_ENUM_VALUE(flexWrap, FBKYgWrap(), YGWrap);
    FBK_SET_YG_ENUM_VALUE(overflow, FBKYgOverflow(), YGOverflow);
    FBK_SET_YG_ENUM_VALUE(display, FBKYgDisplay(), YGDisplay);
    
    FBK_SET_YG_CGFloat_VALUE(flexGrow);
    FBK_SET_YG_CGFloat_VALUE(flexShrink);
    FBK_SET_YG_VALUE(flexBasis);
    
    FBK_SET_YG_VALUE(left);
    FBK_SET_YG_VALUE(top);
    FBK_SET_YG_VALUE(right);
    FBK_SET_YG_VALUE(bottom);
    FBK_SET_YG_VALUE(start);
    FBK_SET_YG_VALUE(end);
    
    FBK_SET_YG_VALUE(marginLeft);
    FBK_SET_YG_VALUE(marginTop);
    FBK_SET_YG_VALUE(marginRight);
    FBK_SET_YG_VALUE(marginBottom);
    FBK_SET_YG_VALUE(marginStart);
    FBK_SET_YG_VALUE(marginEnd);
    FBK_SET_YG_VALUE(marginHorizontal);
    FBK_SET_YG_VALUE(marginVertical);
    FBK_SET_YG_VALUE(margin);
    
    FBK_SET_YG_VALUE(paddingLeft);
    FBK_SET_YG_VALUE(paddingTop);
    FBK_SET_YG_VALUE(paddingRight);
    FBK_SET_YG_VALUE(paddingBottom);
    FBK_SET_YG_VALUE(paddingStart);
    FBK_SET_YG_VALUE(paddingEnd);
    FBK_SET_YG_VALUE(paddingHorizontal);
    FBK_SET_YG_VALUE(paddingVertical);
    FBK_SET_YG_VALUE(padding);
    
    FBK_SET_YG_CGFloat_VALUE(borderLeftWidth);
    FBK_SET_YG_CGFloat_VALUE(borderTopWidth);
    FBK_SET_YG_CGFloat_VALUE(borderRightWidth);
    FBK_SET_YG_CGFloat_VALUE(borderBottomWidth);
    FBK_SET_YG_CGFloat_VALUE(borderStartWidth);
    FBK_SET_YG_CGFloat_VALUE(borderEndWidth);
    FBK_SET_YG_CGFloat_VALUE(borderWidth);
    FBK_SET_YG_CGFloat_VALUE(aspectRatio);
    
    FBK_SET_YG_VALUE(width);
    FBK_SET_YG_VALUE(height);
    FBK_SET_YG_VALUE(minWidth);
    FBK_SET_YG_VALUE(minHeight);
    FBK_SET_YG_VALUE(maxWidth);
    FBK_SET_YG_VALUE(maxHeight);
    
    NSLog(@"Flexbox: not supported layout attr - %@",key);
};


@end
