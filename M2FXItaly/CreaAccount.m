//
//  CreaAccount.m
//  M2FXItaly
//
//  Created by ctd on 15/6/10.
//  Copyright (c) 2015年 ctd. All rights reserved.
//

#import "CreaAccount.h"

@interface CreaAccount ()

@end

@implementation CreaAccount

- (void)viewDidLoad {
    [super viewDidLoad];
    self.passWordF.keyboardType = UIKeyboardTypeNumberPad;
    self.passWordF.clearButtonMode = UITextFieldViewModeAlways;
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
- (IBAction)saClick:(UIButton *)sender {
    
    NSLog(@"_passWordF = %@",_passWordF.text);
    [[NSUserDefaults standardUserDefaults] setValue:_passWordF.text forKey:@"password"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)ttswichtest:(id)sender {
    
    
}
@end
