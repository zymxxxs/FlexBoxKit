//
//  UIColor+FBKExtension.m
//  FlexBoxKit
//
//  Created by zym on 2018/12/22.
//

#import "UIColor+FBKExtension.h"

@implementation UIColor (FBKExtension)

+ (UIColor *)fbk_randomColor {
    NSInteger aRedValue = arc4random() % 255;
    NSInteger aGreenValue = arc4random() % 255;
    NSInteger aBlueValue = arc4random() % 255;
    UIColor *randColor = [UIColor colorWithRed:aRedValue / 255.f
                                         green:aGreenValue / 255.f
                                          blue:aBlueValue / 255.f
                                         alpha:1.f];
    return randColor;
}
@end
