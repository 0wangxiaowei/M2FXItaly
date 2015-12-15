//
//  MainViewController.m
//  M2FXItaly
//
//  Created by ctd on 15/6/9.
//  Copyright (c) 2015年 ctd. All rights reserved.
//

#import "MainViewController.h"
#import "sendSMS.h"
#import "user.h"
#import "SmartsetView.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    UIView *myview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 64)];
    myview.backgroundColor = [UIColor whiteColor];
    UIButton *backbtn = [[UIButton alloc] initWithFrame:CGRectMake(15, 25, 30, 30)];
    [myview addSubview:backbtn];
    [backbtn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [backbtn addTarget:self action:@selector(backpre) forControlEvents:UIControlEventTouchUpInside];
    UILabel *titielab = [[UILabel alloc] initWithFrame:CGRectMake(myview.bounds.size.width-200, 20, 200, 44)];
    backbtn.titleLabel.text = @"back";
    [myview addSubview:titielab];
    titielab.text = @"titleTest";
    [self.view addSubview:myview];
//    UISwitch
//    self.navigationIt
    //
}
- (IBAction)mainbtnClick:(id)sender {
    UIButton *sender1 = (UIButton *)sender;
    NSLog(@"%d",sender1.tag);
    
    
    switch (sender1.tag) {
        case 1://布防
        {
            
            [sendSMS sendSMSPhone:_seluser.phoneNum SMSContent:@"#123456#" delegate:self];
        }
            break;
        case 2://撤防
        {
            [sendSMS sendSMSPhone:_seluser.phoneNum SMSContent:@"#123456#" delegate:self];
        }
            break;
        case 3://在家布防
        {
            [sendSMS sendSMSPhone:_seluser.phoneNum SMSContent:@"#123456#" delegate:self];
        }
            break;
        case 4://smartswitch
        {
            SmartsetView *set = [[SmartsetView alloc] init];
            [self.navigationController pushViewController:set animated:YES];
        }
            break;
        case 5://状态
        {
            [sendSMS sendSMSPhone:_seluser.phoneNum SMSContent:@"#123456#" delegate:self];
        }
            break;
            
        default:
            break;
    }
}

- (void)backpre {
    [self.navigationController popViewControllerAnimated:YES];
    // Dispose of any resources that can be recreated.
}
-(void)back:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
