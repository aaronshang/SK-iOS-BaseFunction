//
//  TestBlock.h
//  SK-iOS-BaseFunction
//
//  Created by kai.shang on 16/4/20.
//  Copyright © 2016年 SK. All rights reserved.
//
/**
 
 Blocks一般都是小段的，自成体系的代码块. 因此，特别适合用在封转并行操作所需的数据，或用于集合中，以及操作完成后的回调.
 Blocks基于两大理由，是传统回调函数的优秀替代品:
 允许你把具体实现代码写在调用该方法的地方.   Blocks也经常是framework的方法参数.
 可以访存局部变量. 不需要像以前的回调一样，把在操作后所有需要用到的数据封装成特定的数据结构, 你完全可以直接访问局部变量.
 
 Block作为参数使用，常见于各框架之中，比如在封装一个类时，当做什么事情由外界去决定，什么时候调用由自己的类决定时，这时候就需要将block作为参数使用。
 
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
