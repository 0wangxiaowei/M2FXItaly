//
//  sendSMS.h
//  QG-G06
//
//  Created by ctd on 14/12/18.
//  Copyright (c) 2014年 ctd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Toast+UIView.h"
#import <MessageUI/MessageUI.h>

@interface sendSMS : NSObject

//发送短信
+ (void)sendSMSPhone:(NSString *)SMSphone SMSContent:(NSString *)smsContent delegate:(id)delegate;
//判断设备是否能发送短信
+ (NSInteger)isSendSMS;

@end
