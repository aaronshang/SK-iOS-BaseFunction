//
//  GetAddressBook.h
//  SK-iOS-BaseFunction
//
//  Created by kai.shang on 16/4/19.
//  Copyright © 2016年 SK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AddressPerson: NSObject
@property(nonatomic, copy) NSString *name;
@property(nonatomic, copy) NSString *phone;
@property(nonatomic, strong) NSData *headImageData;
@end

@interface GetAddressBook : NSObject

-(void) loadPerson;

-(NSArray *)getAddressPersonAry;

@end
