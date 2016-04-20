//
//  TestBlock.h
//  SK-iOS-BaseFunction
//
//  Created by kai.shang on 16/4/20.
//  Copyright © 2016年 SK. All rights reserved.
//
/**
 
 此文件用于演示Block的用法
 
 1 用作函数
 //声明
 void (^startFire)(NSString * gun);
 
 2 用作参数
    声明
     -(void) startWrok:(successBlock) success;
    
    实现
    -(void) startWrok:(successBlock) success{
     
     NSLog(@"after hard working");
     
     success(@"a man named king finish work.");
     }
    
    调用
    [self startWrok:^(NSString *content) {
     
     NSLog(@"receive success info");
     
     NSLog(@"%@", content);
     }];
    将一个函数作为参数传入函数。
 
 
 */

#import <Foundation/Foundation.h>

@interface TestBlock : NSObject
-(void) testFunction;
@end
