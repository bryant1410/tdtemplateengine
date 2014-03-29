// The MIT License (MIT)
//
// Copyright (c) 2014 Todd Ditchendorf
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "TDNode.h"
#import "TDFragment.h"

@interface TDNode ()

@end

@implementation TDNode

+ (instancetype)nodeWithFragment:(TDFragment *)frag {
    return [[[self alloc] initWithFragment:frag] autorelease];
}


- (instancetype)initWithFragment:(TDFragment *)frag {
    NSParameterAssert(frag);
    self = [super init];
    if (self) {
        self.fragment = frag;
        self.children = [NSMutableArray array];
        self.createsScope = NO;
        [self processFragment:frag];
    }
    return self;
}


- (void)dealloc {
    self.fragment = nil;
    self.children = nil;
    [super dealloc];
}


- (NSString *)description {
    return [NSString stringWithFormat:@"<%@ %p>", [self class], self];
}


#pragma mark -
#pragma mark Public

- (void)processFragment:(TDFragment *)frag {
    //NSAssert2(0, @"%s is an abstract method and must be implemented in %@", __PRETTY_FUNCTION__, [self class]);
}


- (NSString *)renderInContext:(TDTemplateContext *)ctx {
    //NSAssert2(0, @"%s is an abstract method and must be implemented in %@", __PRETTY_FUNCTION__, [self class]);

    return [self renderChildren:nil inContext:ctx];
}


- (void)enterScope {
    
}


- (void)exitScope {
    
}


#pragma mark -
#pragma mark Private

- (NSString *)renderChildren:(NSArray *)children inContext:(TDTemplateContext *)ctx {
    children = children ? children : _children;
    
    NSMutableString *buff = [NSMutableString string];
    for (TDNode *child in children) {
        NSString *childStr = [child renderInContext:ctx];
        if (childStr) {
            [buff appendString:childStr];
        }
    }

    return buff;
}

@end
