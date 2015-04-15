//
//  MCColorViewController.m
//  Colorboard
//
//  Created by Matthew Chupp on 4/14/15.
//  Copyright (c) 2015 MattChupp. All rights reserved.
//

#import "MCColorViewController.h"
#import "MCColorDescription.h"

@interface MCColorViewController ()

@property (nonatomic, weak) IBOutlet UITextField *textField;

@property (nonatomic, weak) IBOutlet UISlider *redSlider;
@property (nonatomic, weak) IBOutlet UISlider *greenSlider;
@property (nonatomic, weak) IBOutlet UISlider *blueSlider;

@end

@implementation MCColorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIColor *color = self.colorDescription.color;
    
    // Get the RGB values out of the UIColor object
    CGFloat red, green, blue;
    [color getRed:&red
            green:&green
             blue:&blue
            alpha:nil];
    
    // Set the initial slider values
    self.redSlider.value = red;
    self.blueSlider.value = blue;
    self.greenSlider.value = green;
    
    // Set the background color and text field value
    self.view.backgroundColor = color;
    self.textField.text = self.colorDescription.name;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // Remove the 'Done' button if this is an existing color
    if (self.existingColor) {
        self.navigationItem.rightBarButtonItem = nil;
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    self.colorDescription.name = self.textField.text;
    self.colorDescription.color = self.view.backgroundColor; 
}

- (IBAction)dismiss:(id)sender {

    [self.presentingViewController dismissViewControllerAnimated:YES
                                                      completion:NULL];
}

- (IBAction)changeColor:(id)sender {
    
    float red = self.redSlider.value;
    float green = self.greenSlider.value;
    float blue = self.blueSlider.value;
    UIColor *newColor = [UIColor colorWithRed:red
                                        green:green
                                         blue:blue
                                        alpha:1.0];
    self.view.backgroundColor = newColor; 
}

@end
