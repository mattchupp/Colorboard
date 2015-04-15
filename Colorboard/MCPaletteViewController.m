//
//  MCPaletteViewController.m
//  Colorboard
//
//  Created by Matthew Chupp on 4/14/15.
//  Copyright (c) 2015 MattChupp. All rights reserved.
//

#import "MCPaletteViewController.h"
#import "MCColorViewController.h"
#import "MCColorDescription.h"

@interface MCPaletteViewController ()

@property (nonatomic) NSMutableArray *colors;

@end


@implementation MCPaletteViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"NewColor"]) {
        
        // If we are adding a new color, create an instance
        // and add it to the colors array
        MCColorDescription *color = [[MCColorDescription alloc] init];
        [self.colors addObject:color];
        
        // Then use the segue to set the color on the view controller
        UINavigationController *nc =
        (UINavigationController *)segue.destinationViewController;
        MCColorViewController *mvc =
        (MCColorViewController *)[nc topViewController];
        mvc.colorDescription = color;
    } else if ([segue.identifier isEqualToString:@"ExistingColor"]) {
        
        // For the push segue, the sender is the UITableViewCell
        NSIndexPath *ip = [self.tableView indexPathForCell:sender];
        MCColorDescription *color = self.colors[ip.row];
        
        // Set the color, and also tell the view controller that this
        // is an existing color
        MCColorViewController *cvc =
        (MCColorViewController *)segue.destinationViewController;
        cvc.colorDescription = color;
        cvc.existingColor = YES;
    }
}

- (NSInteger)tableView:(UITableView *)tableView
         numberOfRowsInSection:(NSInteger)section {
    
    return [self.colors count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell =
        [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"
                                        forIndexPath:indexPath];
    MCColorDescription *color = self.colors[indexPath.row];
    cell.textLabel.text = color.name; 
    
    return cell;
}

- (NSMutableArray *)colors {
    if (!_colors) {
        _colors = [NSMutableArray array];
        
        MCColorDescription *cd = [[MCColorDescription alloc] init];
        [_colors addObject:cd];
    }
    return _colors;
}

@end
