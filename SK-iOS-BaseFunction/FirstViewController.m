//
//  FirstViewController.m
//  SK-iOS-BaseFunction
//
//  Created by kai.shang on 16/1/11.
//  Copyright © 2016年 SK. All rights reserved.
//

#import "FirstViewController.h"
#import "InternetTime/KInternetTime.h"

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
    
    [[KInternetTime sharedInstance] startRequest];
    
    [KInternetTime sharedInstance].notiBlock=^(NSDate * date){
        
        NSLog(@"Get Success Time %@", date);
        
    };
}

@end
