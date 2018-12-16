//
//  FbkViewController.m
//  FlexBoxKit
//
//  Created by zym on 12/16/2018.
//  Copyright (c) 2018 zym. All rights reserved.
//

#import "ViewController.h"
#import <YogaKit/YGLayout.h>
#import <YogaKit/UIView+Yoga.h>


#import <FlexBoxKit/FlexBoxKit.h>

@interface ViewController ()



@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    NSString *layoutXMLPath = [[NSBundle mainBundle] pathForResource:@"Test" ofType:@"xml"];
    FBKXMLParser *xmlParser = [[FBKXMLParser alloc] init];
    FBKNodeModel *nodeModel = [xmlParser parseWithXMLPath:layoutXMLPath];
    
    FBKNodeLayout *nodeLayout = [[FBKNodeLayout alloc] initWithNodeModel:nodeModel];
    UIView *rootView = [nodeLayout layout];
    [self.view addSubview: rootView];
    
    [rootView.yoga applyLayoutPreservingOrigin:true];
}



@end
