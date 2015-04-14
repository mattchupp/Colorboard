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

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    
    return [self.colors count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"
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
