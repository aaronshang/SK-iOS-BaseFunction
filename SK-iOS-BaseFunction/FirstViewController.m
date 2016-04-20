//
//  FirstViewController.m
//  SK-iOS-BaseFunction
//
//  Created by kai.shang on 16/1/11.
//  Copyright © 2016年 SK. All rights reserved.
//

#import "FirstViewController.h"
#import "InternetTime/KInternetTime.h"
#import "BlockFunction.h"
#import "DeclaredProperty.h"
#import "TestDeepCopy.h"
#import "GetAddressBook.h"
#import "TestBlock.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction) getNetTime:(id)sender{
    
    TestBlock *block = [[TestBlock alloc] init];
    [block testFunction];

//    GetAddressBook *book = [[GetAddressBook alloc] init];
//    [book loadPerson];
//    for (AddressPerson *person in [book getAddressPersonAry]) {
//        NSLog(@"name %@",person.name);
//    }
    
//    TestDeepCopy *deep = [TestDeepCopy alloc];
//    [deep test];
    
//    DeclaredProperty *pro = DeclaredProperty.new;
//    [pro test];
    
//    BlockFunction *blockFun = [BlockFunction alloc];
//    [blockFun test];
    
    
//    [[KInternetTime sharedInstance] startRequest];
//    
//    [KInternetTime sharedInstance].notiBlock=^(NSDate * date){
//        
//        NSLog(@"Get Success Time %@", date);
//        
//    };

}

@end
