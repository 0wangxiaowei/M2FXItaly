//
//  sendSMS.m
//  QG-G06
//
//  Created by ctd on 14/12/18.
//  Copyright (c) 2014年 ctd. All rights reserved.
//

#import "sendSMS.h"

@implementation sendSMS

//发送短信
+ (void)sendSMSPhone:(NSString *)SMSphone SMSContent:(NSString *)smsContent delegate:(id)delegate
{
    if ([self isSendSMS] == 0) {
        
        MFMessageComposeViewController *picker = [[MFMessageComposeViewController alloc] init];
        picker.messageComposeDelegate = delegate;//设置代理
        picker.body = smsContent;//短信内容
        picker.recipients = [NSArray arrayWithObject:SMSphone];//发送短信号码
        
        [delegate presentViewController:picker animated:YES completion:nil];
    }
    
}
//判断能否发送短信
+ (NSInteger)isSendSMS
{
    Class messageClass = (NSClassFromString(@"MFMessageComposeViewController"));
    
    if (messageClass == nil) {
        
        return 1;
    }
    if (![MFMessageComposeViewController canSendText]) {
        
        return 2;
    }
    
    return 0;
}

@end
