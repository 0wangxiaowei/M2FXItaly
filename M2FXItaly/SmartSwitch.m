//
//  SmartSwitch.m
//  M2FXItaly
//
//  Created by ctd on 15/6/9.
//  Copyright (c) 2015年 ctd. All rights reserved.
//

#import "SmartSwitch.h"
#import "SmartSwitchCell.h"
#import "MainViewController.h"
#import "SmartWall.h"
#import "user.h"
#import "wolfdata.h"
#import "CreaAccount.h"
@interface SmartSwitch ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)UITableView *myTabelView;
@property (nonatomic,strong)NSMutableArray *list;
@property (nonatomic,strong) wolfdata *db;//数据库
@end

@implementation SmartSwitch

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setCustomNav];
    
//    self.title = @"SmartSwith";
//    self.navigationItem.leftBarButtonItem.title = nil;
    _myTabelView = [[UITableView alloc] initWithFrame:CGRectMake((self.view.bounds.size.width-300)/2, 64, 300, self.view.bounds.size.height-200) style:UITableViewStylePlain];
    [self.view addSubview:_myTabelView];
    _myTabelView.delegate = self;
    _myTabelView.dataSource= self;
   [_myTabelView registerNib:[UINib nibWithNibName:@"SmartSwitchCell" bundle:nil] forCellReuseIdentifier:@"Cell"];
    UIButton *addbu= [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:addbu];
    addbu.frame = CGRectMake(20, self.view.bounds.size.height-70, 45, 45);
    [addbu setImage:[UIImage imageNamed:@"+2"] forState:UIControlStateNormal];
    
    [addbu addTarget:self action:@selector(addUser1:) forControlEvents:UIControlEventTouchUpInside];
    UIButton *setbu= [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:setbu];
    setbu.frame = CGRectMake(self.view.bounds.size.width-80, self.view.bounds.size.height-70, 45, 45);
    [setbu setImage:[UIImage imageNamed:@"set2"] forState:UIControlStateNormal];
    
    [setbu addTarget:setbu action:@selector(changemima:) forControlEvents:UIControlEventTouchUpInside];
    
    _db = [[wolfdata alloc]init];//初始化db
    
    //自动调整滚动视图集,列表显示位移
//    self.automaticallyAdjustsScrollViewInsets = NO;
    // Do any additional setup after loading the view.
}

-(void)setCustomNav
{

    self.navigationController.navigationBar.hidden = YES;
    UIView *myview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 64)];
    myview.backgroundColor = [UIColor whiteColor];
    UIButton *backbtn = [[UIButton alloc] initWithFrame:CGRectMake(15, 25, 30, 30)];
    [myview addSubview:backbtn];
    [backbtn setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [backbtn addTarget:self action:@selector(backpre) forControlEvents:UIControlEventTouchUpInside];
        backbtn.backgroundColor = [UIColor redColor];
    UILabel *titielab = [[UILabel alloc] initWithFrame:CGRectMake(myview.bounds.size.width-200, 20, 200, 44)];
    backbtn.titleLabel.text = @"back";
    [myview addSubview:titielab];
    titielab.text = @"titleTest";
    [self.view addSubview:myview];
}
-(void)backpre
{
    [self.navigationController popViewControllerAnimated:YES];
    }
-(void)viewWillAppear:(BOOL)animated{
    [self.navigationItem setTitle:NSLocalizedString(@"Manage", @"")];
    
    _list = [_db selectAllData]; //获取全部list数据
    [_myTabelView reloadData];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return 50;
}
// 一组几行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_list count];
//    return 5;
}
//每一行的内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    SmartSwitchCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    cell.nameLabel.text =[NSString stringWithFormat:@"%@",[[_list objectAtIndex:indexPath.row] userName]];
    [cell.nextBtn addTarget:self action:@selector(nextBtn:) forControlEvents:UIControlEventTouchUpInside];
    cell.nextBtn.tag= 100+indexPath.row;
    cell.setBtn.tag = 1000+indexPath.row;
    [cell.setBtn addTarget:self action:@selector(adduserN:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

-(void)nextBtn:(UIButton *)sender
{

    
    MainViewController *main = [[MainViewController alloc] init];
       main.seluser = [_list objectAtIndex:sender.tag-100];
    [self.navigationController pushViewController:main animated:YES];

}

-(void)changemima:(UIButton *)sender
{
    
    CreaAccount *main = [[CreaAccount alloc] init];
//    main.addUser = [_list objectAtIndex:sender.tag-1000];
    [self.navigationController pushViewController:main animated:YES];
    
}
-(void)adduserN:(UIButton *)sender
{
    
    SmartWall *main = [[SmartWall alloc] init];
    main.addUser = [_list objectAtIndex:sender.tag-1000];
    [self.navigationController pushViewController:main animated:YES];
    
}
-(void)addUser1:(UIButton *)sender
{
    
    SmartWall *main = [[SmartWall alloc] init];
    [self.navigationController pushViewController:main animated:YES];
    
}
@end
