//
//  TableViewController.m
//  YogaKitSample
//
//  Created by skladmin on 2017/1/3.
//  Copyright © 2017年 facebook. All rights reserved.
//

#import "TableViewController.h"
#import "DemoViewController.h"

static NSString *cellId = @"cellId";

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Yoga_Demo";
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellId];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [self titles].count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    cell.textLabel.text = [[self titles] objectAtIndex:indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DemoViewController *demo = [[DemoViewController alloc]init];
    demo.identifier = [[self titles] objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:demo animated:YES];
}

- (NSArray<NSString *> *)titles
{
    return @[@"FlexDirection",
             @"JustifyContent",
             @"FlexWrap",
             @"Alignment",
             @"FlexGrow",
             @"FlexShrink",
             @"FlexBasis",
             @"AbsolutePositioning",
             @"MarginPadding",
             @"AspectRatio",];
}


@end
