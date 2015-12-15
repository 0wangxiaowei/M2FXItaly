//
//  user.m
//  M2E1
//
//  Created by zjw on 1/14/14.
//  Copyright (c) 2014 yl. All rights reserved.
//

#import "user.h"

@implementation user

@synthesize userName = _userName;
@synthesize passWord = _passWord;
@synthesize phoneNum = _phoneNum;
@synthesize userId =_userId;

#pragma mark - func

-(id)init
{
    self = [super init];
    return self;
}

-(id)initWithUserName:(NSString *)username passWord:(NSString *)password phoneNum:(NSString *)phonenum
{
    self = [super init];
    if(self){
        _userName = username;
        _passWord = password;
        _phoneNum = phonenum;
    }
    return self;
}

@end
