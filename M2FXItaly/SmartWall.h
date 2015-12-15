//
//  SmartWall.h
//  M2FXItaly
//
//  Created by ctd on 15/6/9.
//  Copyright (c) 2015年 ctd. All rights reserved.
//

#import <UIKit/UIKit.h>
@class user;
@interface SmartWall : UIViewController
@property (nonatomic,assign) BOOL isadd;

@property (weak, nonatomic) IBOutlet UITextField *numFD;
@property (weak, nonatomic) IBOutlet UITextField *passwordFD;
@property (weak, nonatomic) IBOutlet UITextField *nameFD;
- (IBAction)elminaClick:(UIButton *)sender;
- (IBAction)salvaClick:(UIButton *)sender;
@property (nonatomic,strong) user *addUser;
@property (weak, nonatomic) IBOutlet UIButton *eliminabut;

@end
