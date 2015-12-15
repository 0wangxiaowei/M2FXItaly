//
//  LockViewController.m
//  M2FXItaly
//
//  Created by ctd on 15/6/9.
//  Copyright (c) 2015年 ctd. All rights reserved.
//

#import "LockViewController.h"
#import "SmartSwitch.h"
#import "CreaAccount.h"
#import "TTSwitch.h"

@interface LockViewController ()

@property (nonatomic,strong)UITextField *feild;
@end

@implementation LockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.hidden = YES;
    
    UIImageView *bgView = [[UIImageView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:bgView];
    bgView.userInteractionEnabled = YES;
    bgView.image =[UIImage imageNamed:@"主界面-1.jpg"];

//    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"主界面-1.jpg"]];
    UITextField *feild = [[UITextField alloc] initWithFrame:CGRectMake((self.view.bounds.size.width-250)/2, 200, 250, 45)];
    _feild = feild;
    feild.clearButtonMode = UITextFieldViewModeAlways;
//   NSString *str= [[NSUserDefaults standardUserDefaults] objectForKey:@"password"];
//    feild.text
    feild.placeholder = @"Password";
    feild.text = nil;
    feild.keyboardType = UIKeyboardTypeNumberPad;
    feild.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:feild];
    UIButton *okbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    okbutton.frame =CGRectMake((self.view.bounds.size.width-250)/2+170, 250, 80, 40);
    [self.view addSubview:okbutton];
    [okbutton setImage:[UIImage imageNamed:@"okselt"] forState:UIControlStateNormal];
    [okbutton addTarget:self action:@selector(okClick) forControlEvents:UIControlEventTouchUpInside];
    UIButton *addbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    addbutton.frame =CGRectMake(20, self.view.bounds.size.height*7/9, 100, 45);
    [self.view addSubview:addbutton];
    [addbutton setImage:[UIImage imageNamed:@"Crea"] forState:UIControlStateNormal];
    [addbutton addTarget:self action:@selector(addClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [[TTSwitch appearance] setTrackImage:[UIImage imageNamed:@"round-switch-track"]];
    [[TTSwitch appearance] setOverlayImage:[UIImage imageNamed:@"round-switch-overlay"]];
    [[TTSwitch appearance] setTrackMaskImage:[UIImage imageNamed:@"round-switch-mask"]];
    [[TTSwitch appearance] setThumbImage:[UIImage imageNamed:@"round-switch-thumb"]];
    [[TTSwitch appearance] setThumbHighlightImage:[UIImage imageNamed:@"round-switch-thumb-highlight"]];
    [[TTSwitch appearance] setThumbMaskImage:[UIImage imageNamed:@"round-switch-mask"]];
    [[TTSwitch appearance] setThumbInsetX:-3.0f];
    [[TTSwitch appearance] setThumbOffsetY:-3.0f];
    TTSwitch *s = [[TTSwitch alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:s];
    
    // Do any additional setup after loading the view.
}
-(void)addClick:(UIButton *)sender
{
    CreaAccount *cvc = [[CreaAccount alloc] init];
    [self.navigationController pushViewController:cvc animated:YES];
    

}
- (void)okClick {
    NSUserDefaults *def =  [NSUserDefaults standardUserDefaults];
 NSString *pass =   [def objectForKey:@"password"];
    if (![pass isEqualToString:_feild.text]) {
        return;
    }
    SmartSwitch *sm = [[SmartSwitch alloc] init];
    [self.navigationController pushViewController:sm animated:YES];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
-(void)viewWillAppear:(BOOL)animated
{
    _feild.text = @"";
}

@end
