//
//  SmartsetView.m
//  M2FXItaly
//
//  Created by ctd on 15/6/10.
//  Copyright (c) 2015年 ctd. All rights reserved.
//

#import "SmartsetView.h"

#import "TTSwitch.h"

#import "TTControlItem.h"
#import "TTControlCell.h"

@interface SmartsetView () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *items;



@end

@implementation SmartsetView

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [tableView setAutoresizingMask:UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth];
    [tableView setDelegate:self];
    [tableView setDataSource:self];
    [self.view addSubview:tableView];
    self.tableView = tableView;
    

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    return [self.items count];
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TTControlCell *cell =[tableView dequeueReusableCellWithIdentifier:[TTControlCell cellIdentifier]];
    if (!cell) {
        cell =[[TTControlCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[TTControlCell cellIdentifier]];
    
    }
    cell.test = @"agsfhdfjgh";
//    id item = self.items[indexPath.row];
    cell.textLabel.text = @"asgh";
    return  cell;
}

#pragma mark - UITableViewDelegate

//- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    id item = self.items[indexPath.row];
//    [((TTControlCell *)cell) setControlItem:item];
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
