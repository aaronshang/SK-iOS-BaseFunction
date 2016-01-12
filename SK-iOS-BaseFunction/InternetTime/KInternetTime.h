/*******************************************************************************
     Copyright (C), 2011-2013, kai.shang
     
     File name:  KInternetTime.h
     Author:     kai.shang
     E-mail:     skwaityou@gmail.com
     
     Description:
            获取网络侧时间,原理（http协议应答时间解析）。
     
     History:
         2016-01-08: create
 
     
     Copyright information:
            This file was intended to be under GPL protocol. However, I may use this library
         in my work as I am an employee. And my company may require me to keep it secret.
         Therefore, this file is neither open source nor under GPL control.
     
 ********************************************************************************/




#import <Foundation/Foundation.h>

typedef void(^NotiBlock)(NSDate* date);

typedef enum _TRequsetStatus
{
    EStatusNone,
    EStatusRequesting,
    EStatusRequestFailure,
    EStatusRequestSuccess,
}TRequsetStatus;

@interface KInternetTime : NSObject{
    
}
@property(nonatomic, copy)NotiBlock notiBlock;

+(instancetype)sharedInstance;

-(void) startRequest;

-(void) cancelRequest;

-(TRequsetStatus) currentStatus;



@end
