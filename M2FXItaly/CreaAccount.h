//
//  CreaAccount.h
//  M2FXItaly
//
//  Created by ctd on 15/6/10.
//  Copyright (c) 2015年 ctd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TTSwitch.h"

@interface CreaAccount : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *passWordF;
- (IBAction)saClick:(UIButton *)sender;
- (IBAction)ttswichtest:(id)sender;
@property (weak, nonatomic) IBOutlet TTSwitch *test;

@end
