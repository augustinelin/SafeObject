//
//  NSDictionary+Safe.m
//  SafeObjectCrash
//
//  Created by lujh on 2018/4/18.
//  Copyright © 2018年 lujh. All rights reserved.
//

#import "NSDictionary+Safe.h"
#import <objc/runtime.h>
#import "NSObject+ImpChangeTool.h"

@implementation NSDictionary (Safe)
+ (void)load{
    [self SwizzlingMethod:@"initWithObjects:forKeys:count:" systemClassString:@"__NSPlaceholderDictionary" toSafeMethodString:@"initWithObjects_st:forKeys:count:" targetClassString:@"NSDictionary"];
}
-(instancetype)initWithObjects_st:(id *)objects forKeys:(id<NSCopying> *)keys count:(NSUInteger)count {
    for (NSUInteger i = 0; i < count; i++) {
        if (!(keys[i] && objects[i])) {
            if (!objects[i]) {
                objects[i] = [NSNull null];
            }
        }
    }
    self = [self initWithObjects_st:objects forKeys:keys count:count];
    return self;
}

@end
