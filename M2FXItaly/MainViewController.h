//
//  MainViewController.h
//  M2FXItaly
//
//  Created by ctd on 15/6/9.
//  Copyright (c) 2015年 ctd. All rights reserved.
//

#import <UIKit/UIKit.h>
@class user;
@interface MainViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *bgView;

@property (nonatomic,strong)user *seluser;
@end
