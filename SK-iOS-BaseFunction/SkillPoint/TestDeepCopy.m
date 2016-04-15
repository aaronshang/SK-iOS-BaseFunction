//
//  TestDeepCopy.m
//  SK-iOS-BaseFunction
//
//  Created by kai.shang on 16/4/15.
//  Copyright © 2016年 SK. All rights reserved.
//

#import "TestDeepCopy.h"

@interface Person : NSObject
@property(nonatomic) NSString *name;
@property(nonatomic) NSInteger age;
@end

@implementation Person

- (id)copyWithZone:(NSZone *)zone{
    
    Person *per = [Person allocWithZone:zone];
    per.age = self.age;
    per.name = [self.name copy];
    return per;
}

@end

@implementation TestDeepCopy

-(void) test{
    
    Person *person = [[Person alloc] init];
    person.name = @"king";
    person.age = 12;
    
    //对象实现copyWithZone可用copy
    Person *wang = [person copy];
    
    NSLog(@"Object %@, %@", person, wang);
    
    NSLog(@"person %p", person.name);
    NSLog(@"wang %@ age %ld", wang.name, wang.age);
    
}

@end
