//
//  KInternetTime.h
//  SK-iOS-BaseFunction
//
//  Created by kai.shang on 16/1/11.
//  Copyright © 2016年 SK. All rights reserved.
//

/****************************************************************************
 *
 *功能：
 *  1、获取网络侧时间
 *
 *原理：
 *  1、http协议应答时间解析
 *
 *
 */


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
