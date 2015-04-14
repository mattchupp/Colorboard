//
//  MCColorViewController.m
//  Colorboard
//
//  Created by Matthew Chupp on 4/14/15.
//  Copyright (c) 2015 MattChupp. All rights reserved.
//

#import "MCColorViewController.h"

@interface MCColorViewController ()

@end

@implementation MCColorViewController

- (IBAction)dismiss:(id)sender {

    [self.presentingViewController dismissViewControllerAnimated:YES
                                                      completion:NULL];
}

@end
