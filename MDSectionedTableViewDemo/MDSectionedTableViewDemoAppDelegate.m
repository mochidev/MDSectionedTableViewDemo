//
//  MDSectionedTableViewDemoAppDelegate.m
//  MDSectionedTableViewDemo
//
//  Created by Dimitri Bouniol on 5/3/11.
//  Copyright 2011 Mochi Development, Inc. All rights reserved.
//  
//  Copyright (c) 2011 Dimitri Bouniol, Mochi Development, Inc.
//  
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//  
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//  
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//  
//  Mochi Dev, and the Mochi Development logo are copyright Mochi Development, Inc.
//  
//  Also, it'd be super awesome if you credited this page in your about screen :)
//  

#import "MDSectionedTableViewDemoAppDelegate.h"
#import "MDSectionedTableView.h"
#import "MDTableViewCell.h"
#import "MDTableViewHeaderCell.h"

@implementation MDSectionedTableViewDemoAppDelegate

@synthesize window;
@synthesize status;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

- (NSInteger)numberOfSectionsInTableView:(MDSectionedTableView *)aTableView
{
    return 30;
}

- (NSInteger)tableView:(MDSectionedTableView *)aTableView numberOfRowsInSection:(NSInteger)section
{
    return section;
}

- (MDTableViewCell *)tableView:(MDSectionedTableView *)aTableView cellForRow:(NSInteger)row inSection:(NSInteger)section
{
    static NSString *cellId = @"cell";
    MDTableViewCell *cell = [aTableView dequeueReusableCellWithIdentifier:cellId];
    
    if (!cell) {
        cell = [MDTableViewCell cellWithReuseIdentifier:cellId];
    }
    
    cell.text = [NSString stringWithFormat:@"Row %d of Section %d", row+1, section+1];
    
    return cell;
}

- (MDTableViewCell *)tableView:(MDSectionedTableView *)aTableView cellForHeaderOfSection:(NSInteger)section
{
    static NSString *cellId = @"headerCell";
    MDTableViewHeaderCell *cell = (MDTableViewHeaderCell *)[aTableView dequeueReusableCellWithIdentifier:cellId];
    
    if (!cell) {
        cell = [MDTableViewHeaderCell cellWithReuseIdentifier:cellId];
    }
    
    cell.text = [NSString stringWithFormat:@"Section Header %d", section+1];
    
    return cell;
}

- (void)tableView:(MDSectionedTableView *)tableView didSelectRow:(NSUInteger)row inSection:(NSUInteger)section
{
    [status setStringValue:[NSString stringWithFormat:@"Selected Row %lu in Section %lu", row+1, section+1]];
}

- (void)tableView:(MDSectionedTableView *)tableView didDoubleClickRow:(NSUInteger)row inSection:(NSUInteger)section
{
    [status setStringValue:[NSString stringWithFormat:@"Double Clicked Row %lu in Section %lu", row+1, section+1]];
}

@end
