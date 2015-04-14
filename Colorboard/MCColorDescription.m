//
//  MCColorDescription.m
//  Colorboard
//
//  Created by Matthew Chupp on 4/14/15.
//  Copyright (c) 2015 MattChupp. All rights reserved.
//

#import "MCColorDescription.h"

@implementation MCColorDescription

- (instancetype)init {
    
    self = [super init];
    if (self) {
        _color = [UIColor colorWithRed:0
                                 green:0
                                  blue:1
                                 alpha:1];
        _name = @"Blue";
    }
    return self;
}

@end
