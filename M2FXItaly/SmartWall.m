//
//  SmartWall.m
//  M2FXItaly
//
//  Created by ctd on 15/6/9.
//  Copyright (c) 2015年 ctd. All rights reserved.
//

#import "SmartWall.h"
#import "user.h"
#import "wolfdata.h"
#import "Toast+UIView.h"
#define Pnleng 6

@interface SmartWall ()

@end

@implementation SmartWall

- (void)viewDidLoad {
    [super viewDidLoad];
    _numFD.keyboardType = UIKeyboardTypeNumberPad;
    _passwordFD.keyboardType = UIKeyboardTypeNumberPad;
    _numFD.clearButtonMode = UITextFieldViewModeAlways;
     _passwordFD.clearButtonMode = UITextFieldViewModeAlways;
     _nameFD.clearButtonMode = UITextFieldViewModeAlways;
    
    // Do any additional setup after loading the view from its nib.
}
//设置标题
-(void)viewWillAppear:(BOOL)animated{
    [self.navigationItem setTitle:NSLocalizedString(@"Add", @"")];
    if(_addUser != nil){
        _eliminabut.hidden = YES;
        _nameFD.text = _addUser.userName;
        _passwordFD.text = _addUser.passWord;
        _numFD.text = _addUser.phoneNum;
    }else{
        _nameFD.text = @"";
        _passwordFD.text = @"123456";
        _numFD.text = @"";
    }
}


//键盘完成按钮操作
-(void)textFeildEditChanged:(NSNotification *)obj
{
    
    
    UITextField * textFeild = (UITextField *)obj.object;
    NSString * subStr = textFeild.text;
    NSString * lang = [[[UITextInputMode activeInputModes] firstObject] primaryLanguage];
    if ([lang isEqualToString:@"zh-Hans"]) {
        UITextRange * selectedRange = [textFeild markedTextRange];
        UITextPosition * position = [textFeild positionFromPosition:selectedRange.start offset:0];
        if (!position) {
            if (subStr.length > Pnleng) {
                textFeild.text = [subStr substringToIndex:Pnleng];
            }
        }
    }else{
        if (subStr.length > Pnleng) {
            textFeild.text = [subStr substringToIndex:Pnleng];
        }
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
- (IBAction)elminaClick:(UIButton *)sender {
    
    
    NSLog(@"删除user");
}

- (IBAction)salvaClick:(UIButton *)sender {
    
    if(_nameFD.text == nil || [_nameFD.text isEqualToString:@""] ||
       _numFD.text == nil || [_numFD.text isEqualToString:@""] ||
       _passwordFD.text == nil || [_passwordFD.text isEqualToString:@""]){
        
        [self.view makeToast:NSLocalizedString(@"Please fill out the information", @"")];
        //        [[iToast makeText:NSLocalizedString(@"Please fill out the information", @"")]show];
        return;
    }
    if (_passwordFD.text.length!=6) {
        [self.view makeToast:@"请输入六位数密码"];
        return;
        
    }
    wolfdata *db = [[wolfdata alloc]init];
    if(_addUser == nil){
        _addUser = [[user alloc] init];
        _addUser.userName = _nameFD.text;
        _addUser.passWord = _passwordFD.text;
        _addUser.phoneNum = _numFD.text;
        
        [db insertData:_addUser];
    }else{
        _addUser.userName = _nameFD.text;
        _addUser.passWord = _passwordFD.text;
        _addUser.phoneNum = _numFD.text;
        [db updateData:_addUser];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}
@end
