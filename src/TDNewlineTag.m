//
//  TDNewlineTag.m
//  TDTemplateEngine
//
//  Created by Todd Ditchendorf on 4/7/14.
//  Copyright (c) 2014 Todd Ditchendorf. All rights reserved.
//

#import "TDNewlineTag.h"

@implementation TDNewlineTag

+ (NSString *)tagName {
    return @"br";
}


+ (NSString *)outputString {
    return @"\n";
}

@end
