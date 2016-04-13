//
//  DeclaredProperty.m
//  SK-iOS-BaseFunction
//
//  Created by kai.shang on 16/4/13.
//  Copyright © 2016年 SK. All rights reserved.
//

#import "DeclaredProperty.h"

@implementation DeclaredProperty


-(void) test{
    
    self.name = @"king";
    
    NSString *kainame = self.name;
    
    self.name = @"kai";
    
    NSLog(@"%@, %@", self.name, kainame);
}

@end
