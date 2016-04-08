//
//  BlockFunction.m
//  SK-iOS-BaseFunction
//
//  Created by SK(QQ: 1323866124) on 16/4/8.
//  Copyright © 2016年 SK. All rights reserved.

#import "BlockFunction.h"

@interface TestDealloc : NSObject{
    NSTimer *timer;
}

@end

@implementation TestDealloc

-(void) testNSTimer{
    
    timer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(runTimer) userInfo:nil repeats:1];
}

/*
 外部，若不主动调用。
 timer会处于validate状态，引用计数不为0.
 导致外部一直等待。
 
 参考网址：http://www.cnblogs.com/wengzilin/p/4347974.html
 */
-(void) cleanTimer{
    
    [timer invalidate];
    timer  = nil;
}

-(void) runTimer{

    NSLog(@"runTimer running");
}

/*
 retainCount为0时，才调用。若发生循环引用，则不会调用。
 */
-(void) dealloc{
    
    NSLog(@"TestDealloc dealloc");
}

@end

#pragma mark-

@interface BlockFunction()

@end

@implementation BlockFunction


#pragma mark-

-(void) test{

    TestDealloc *testDealloc = [TestDealloc alloc];
    [testDealloc testNSTimer];
    [testDealloc cleanTimer]; //关键的，如果不调用，则会造成循环引用。dealloc运行无效，需显示调用。
}

@end
