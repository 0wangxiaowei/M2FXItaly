//
//  user.h
//  M2E1
//
//  Created by zjw on 1/14/14.
//  Copyright (c) 2014 yl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface user : NSObject


@property (nonatomic,strong) NSString *userName;
@property (nonatomic,strong) NSString *passWord;
@property (nonatomic,strong) NSString *phoneNum;
@property (nonatomic,assign) int userId;


//初始化方法
-(id) initWithUserName:(NSString *)username passWord:(NSString *)password phoneNum:(NSString *)phonenum;


@end
