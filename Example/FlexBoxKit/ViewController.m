//
//  FbkViewController.m
//  FlexBoxKit
//
//  Created by zym on 12/16/2018.
//  Copyright (c) 2018 zym. All rights reserved.
//

#import "ViewController.h"
#import <FlexBoxKit/FBKRootView.h>

@interface ViewController ()

@end

@implementation ViewController {
    FBKRootView *_rootView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *layoutXMLPath = [[NSBundle mainBundle] pathForResource:@"Test"
                                                              ofType:@"xml"];
    _rootView = [[FBKRootView alloc] initWithXMLPath:layoutXMLPath];
    _rootView.frame = self.view.bounds;
    [self.view addSubview:_rootView];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    _rootView.frame = self.view.bounds;
}

@end
