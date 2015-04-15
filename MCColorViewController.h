//
//  MCColorViewController.h
//  Colorboard
//
//  Created by Matthew Chupp on 4/14/15.
//  Copyright (c) 2015 MattChupp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class MCColorDescription; 

@interface MCColorViewController : UIViewController

@property (nonatomic) BOOL existingColor;
@property (nonatomic) MCColorDescription *colorDescription;

@end
