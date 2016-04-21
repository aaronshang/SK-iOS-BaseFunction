//
//  TestNumber.m
//  SK-iOS-BaseFunction
//
//  Created by kai.shang on 16/4/20.
//  Copyright © 2016年 SK. All rights reserved.
//

#import "TestNumber.h"

@implementation TestNumber

-(void) test{

    NSNumber *n1 = @1;
    NSNumber *n2 = [NSNumber numberWithFloat:1.2f];
    NSNumber *n3 = [NSNumber numberWithLongLong:2];
    
    if (strcmp(n2.objCType, @encode(float))==0) {
        
    }
    else if(strcmp(n2.objCType, @encode(long long))==0){
    
    }
    else if(strcmp(n2.objCType, @encode(int))==0){
        
    }
    
}

@end
