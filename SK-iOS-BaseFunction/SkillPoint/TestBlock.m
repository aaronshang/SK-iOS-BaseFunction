//
//  TestBlock.m
//  SK-iOS-BaseFunction
//
//  Created by kai.shang on 16/4/20.
//  Copyright © 2016年 SK. All rights reserved.
//



#import "TestBlock.h"

typedef void (^successBlock)(NSString *content);

@interface TestBlock()

-(void) startWrok:(successBlock) success;
@end


@implementation TestBlock

-(void) startWrok:(successBlock) success{
    
    NSLog(@"after hard working");
    
    success(@"a man named king finish work.");
}

-(void) testFunction{
    
    //声明
    void (^startFire)(NSString * gun);
    
    //实现
    startFire=^(NSString * gun){

        NSLog(@"%@ is Fire", gun);
    };
    
    //调用
    startFire(@"LaiFu");
    
    
    [self startWrok:^(NSString *content) {
        
        NSLog(@"receive success info");
        
        NSLog(@"%@", content);
    }];
}

@end
