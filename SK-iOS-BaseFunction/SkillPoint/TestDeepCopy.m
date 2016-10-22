//
//  TestDeepCopy.m
//  SK-iOS-BaseFunction
//
//  Created by kai.shang on 16/4/15.
//  Copyright © 2016年 SK. All rights reserved.
//

/*
[immutableObject copy] // 浅复制
[immutableObject mutableCopy] //单层深复制
[mutableObject copy] //单层深复制
[mutableObject mutableCopy] //单层深复制
*/

#import "TestDeepCopy.h"


@interface Car : NSObject<NSCopying>
@property(nonatomic, copy) NSString *brand;
@end

@implementation Car

- (id)copyWithZone:(nullable NSZone *)zone{
    Car *copy = [[self class] allocWithZone:zone];
    copy.brand = self.brand;
    return copy;
}
@end

#pragma mark-

@interface Person : NSObject<NSCopying>
@property(nonatomic, copy) NSString *name;
@property(nonatomic, assign) NSInteger age;
@property(nonatomic, strong) Car *car;
@end

@implementation Person

- (id)copyWithZone:(NSZone *)zone{
    
    //与alloc init有何区别，为何要用allocWithZone
    Person *per = [[self class] allocWithZone:zone];
    per.age = _age;
    
    //据称，这种方式是name的浅拷贝，但实验证明是深拷贝
    per.name = [self.name copy];
    per.car = [self.car copy];

    return per;
    
    /*
     如果达到对象的浅复制，直接返回self，才是正确的打开方式；上面方案，是深拷贝方式
     return self;
     */
}

@end

@implementation TestDeepCopy

-(void) test{
    
    NSString *name = @"king";
    
    Person *person = [[Person alloc] init];
    person.name = name;
    person.age = 12;
    person.car = [[Car alloc] init];
    person.car.brand = @"Audi";
    
    //对象实现copyWithZone可用copy
    Person *wang = [person copy];

//    person.name = @"new king";
//    person.age = 15;
//    person.car.brand = @"Benz";
    
    NSLog(@"wang %@ age %ld, addr:%p", wang.name, wang.age, wang);
    NSLog(@"person %@ age %ld, addr:%p", person.name, person.age, person);
    
    NSLog(@"object: %p-%p", person, wang);
    NSLog(@"name: %p-%p", person.name, wang.name);
    
    NSLog(@"car: %p-%p", person.car, wang.car);
    
//    //浅拷贝，对象和副本对象有相同的指针
//    NSString *str_ori = @"ori_data";
//    NSString *copy_str = [str_ori copy];
//    NSLog(@"str addr: %p-%p", str_ori, copy_str);
}

@end
