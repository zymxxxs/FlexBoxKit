//
//  FBKYogaUtilities.h
//  Pods
//
//  Created by zym on 2018/12/18.
//

#import <Foundation/Foundation.h>
#import <YogaKit/YGLayout.h>

#define FBK_YOGA_PROPERTY_MAP_METHOD(__function_name__, __map__) \
static inline NSDictionary *__function_name__() {  \
static NSDictionary *dic;  \
static dispatch_once_t onceToken;  \
dispatch_once(&onceToken, ^{  \
dic = __map__;  \
});  \
return dic;  \
}  \


NS_ASSUME_NONNULL_BEGIN

FBK_YOGA_PROPERTY_MAP_METHOD(FBKYgDirection, (@{
                                                @"inherit": @(YGDirectionInherit),
                                                @"ltr": @(YGDirectionLTR),
                                                @"rtl": @(YGDirectionRTL)
                                                }))

FBK_YOGA_PROPERTY_MAP_METHOD(FBKYgFlexDirection, (@{
                                                    @"row": @(YGFlexDirectionRow),
                                                    @"row-reverse": @(YGFlexDirectionRowReverse),
                                                    @"column": @(YGFlexDirectionColumn),
                                                    @"column-reverse": @(YGFlexDirectionColumnReverse)
                                                    }))

FBK_YOGA_PROPERTY_MAP_METHOD(FBKYgJustify, (@{
                                              @"flex-start": @(YGJustifyFlexStart),
                                              @"center": @(YGJustifyCenter),
                                              @"flex-end": @(YGJustifyFlexEnd),
                                              @"space-between": @(YGJustifySpaceBetween),
                                              @"space-around": @(YGJustifySpaceAround),
                                              @"space-evenly": @(YGJustifySpaceEvenly)
                                              }))

FBK_YOGA_PROPERTY_MAP_METHOD(FBKYgAlign, (@{
                                            @"auto": @(YGAlignAuto),
                                            @"flex-start": @(YGAlignFlexStart),
                                            @"center": @(YGAlignCenter),
                                            @"flex-end": @(YGAlignFlexEnd),
                                            @"stretch": @(YGAlignStretch),
                                            @"baseline": @(YGAlignBaseline),
                                            @"space-between": @(YGAlignSpaceBetween),
                                            @"space-around": @(YGAlignSpaceAround)
                                            }))

FBK_YOGA_PROPERTY_MAP_METHOD(FBKYgPositionType, (@{
                                                   @"relative": @(YGPositionTypeRelative),
                                                   @"absolute": @(YGPositionTypeAbsolute)
                                                   }))

FBK_YOGA_PROPERTY_MAP_METHOD(FBKYgWrap, (@{
                                           @"no-wrap": @(YGWrapNoWrap),
                                           @"wrap": @(YGWrapWrap),
                                           @"wrap-reverse": @(YGWrapWrapReverse)
                                           }))

FBK_YOGA_PROPERTY_MAP_METHOD(FBKYgOverflow, (@{
                                               @"visible": @(YGOverflowVisible),
                                               @"hidden": @(YGOverflowHidden),
                                               @"scroll": @(YGOverflowScroll)
                                               }))

FBK_YOGA_PROPERTY_MAP_METHOD(FBKYgDisplay , (@{
                                               @"flex": @(YGDisplayFlex),
                                               @"none": @(YGDisplayNone)
                                               }))


NS_ASSUME_NONNULL_END
