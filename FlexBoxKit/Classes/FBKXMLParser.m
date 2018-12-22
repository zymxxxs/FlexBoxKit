//
//  FbkXMLParser.m
//  FlexBoxKit
//
//  Created by zym on 2018/12/16.
//

#import "FBKXMLParser.h"
#import "NSArray+FBKBlock.h"

#import <Ono/Ono.h>

@implementation FBKXMLParser

- (FBKNodeModel *)parseWithXMLPath:(NSString *)path {
    NSData *xmlData = [[NSData alloc] initWithContentsOfFile:path];
    NSError *error = nil;
    ONOXMLDocument *xmlDocument = [ONOXMLDocument XMLDocumentWithData:xmlData
                                                                error:&error];
    FBKNodeModel *nodeMode = [self parseWithXMlElement:xmlDocument.rootElement];
    return nodeMode;
}

- (FBKNodeModel *)parseWithXMlElement:(ONOXMLElement *)xmlElement {
    FBKNodeModel *nodeModel = [[FBKNodeModel alloc] init];

    nodeModel.className = xmlElement.tag;

    NSString *nameValue = [xmlElement valueForAttribute:@"name"];
    nodeModel.name = nameValue;

    NSString *layoutValue = [xmlElement valueForAttribute:@"layout"];
    if (layoutValue) {
        nodeModel.layouts = [self parseXMLAttributeString:layoutValue];
    }

    NSArray<ONOXMLElement *> *children = xmlElement.children;
    if (children && children.count) {
        NSMutableArray *result = [NSMutableArray array];
        for (ONOXMLElement *xmlElement in children) {
            [result addObject:[self parseWithXMlElement:xmlElement]];
        }
        nodeModel.children = result.copy;
    }
    return nodeModel;
}

- (NSArray *)parseXMLAttributeString:(NSString *)value {
    NSCharacterSet *whiteAndNewlineSet = [NSCharacterSet whitespaceAndNewlineCharacterSet];

    NSArray *components = [value componentsSeparatedByString:@","];
    NSArray *attributes = [[components fbk_map:^id _Nonnull(id _Nonnull object) {
        NSString *value = object;
        return [value stringByTrimmingCharactersInSet:whiteAndNewlineSet];
    }] fbk_filter:^BOOL(id _Nonnull object) {
        NSString *value = object;
        return value && value.length;
    }];

    NSMutableArray *results = [NSMutableArray array];
    for (NSString *value in attributes) {
        NSArray *components = [value componentsSeparatedByString:@":"];
        if (components.count != 2) continue;

        FBKLayoutModel *layoutModel = [[FBKLayoutModel alloc] init];
        layoutModel.name = [components[0] stringByTrimmingCharactersInSet:whiteAndNewlineSet];
        layoutModel.value = [components[1] stringByTrimmingCharactersInSet:whiteAndNewlineSet];

        [results addObject:layoutModel];
    }
    return results.copy;
}

@end
