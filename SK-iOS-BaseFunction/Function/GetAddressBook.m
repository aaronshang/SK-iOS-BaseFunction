//
//  GetAddressBook.m
//  SK-iOS-BaseFunction
//
//  Created by kai.shang on 16/4/19.
//  Copyright © 2016年 SK. All rights reserved.
//

#import "GetAddressBook.h"
#import <AddressBook/AddressBook.h>

@implementation AddressPerson

@end

@interface GetAddressBook()
@property(nonatomic, strong) NSMutableArray *personMAry;
@end

@implementation GetAddressBook

-(void) loadPerson{

    self.personMAry = [NSMutableArray array];
    
    ABAddressBookRef addressBookRef = ABAddressBookCreateWithOptions(NULL, NULL);
    
    if (ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusNotDetermined) {
        ABAddressBookRequestAccessWithCompletion(addressBookRef, ^(bool granted, CFErrorRef error){
            
            CFErrorRef *error1 = NULL;
            ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(NULL, error1);
            [self copyAddressBook:addressBook];
        });
    }
    else if (ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusAuthorized){
        
        CFErrorRef *error = NULL;
        ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(NULL, error);
        [self copyAddressBook:addressBook];
    }
    else {
        
        NSLog(@"没有获取通讯录权限");
    }
}

- (void)copyAddressBook:(ABAddressBookRef)addressBook
{
    CFIndex numberOfPeople = ABAddressBookGetPersonCount(addressBook);
    CFArrayRef people = ABAddressBookCopyArrayOfAllPeople(addressBook);
    
    for ( int i = 0; i < numberOfPeople; i++){
        
        AddressPerson *singlePerson = [[AddressPerson alloc] init];
        
        ABRecordRef person = CFArrayGetValueAtIndex(people, i);
        
        NSString *firstName = (__bridge NSString *)(ABRecordCopyValue(person, kABPersonFirstNameProperty));
        NSString *lastName = (__bridge NSString *)(ABRecordCopyValue(person, kABPersonLastNameProperty));
        [singlePerson setName:[self encapFirstName:firstName withLastName:lastName]];
        
        //读取电话多值
        ABMultiValueRef phone = ABRecordCopyValue(person, kABPersonPhoneProperty);
        for (int k = 0; k<ABMultiValueGetCount(phone); k++)
        {
            //获取該Label下的电话值
            NSString * personPhone = (__bridge NSString*)ABMultiValueCopyValueAtIndex(phone, k);
            NSLog(@"call %@", personPhone);
            [singlePerson setPhone:personPhone];
            break;
        }
        
        //读取照片
        NSData *image = (__bridge NSData*)ABPersonCopyImageData(person);
        [singlePerson setHeadImageData:image];
        
        [self.personMAry addObject:singlePerson];
    }
}

-(NSString *) encapFirstName:(NSString*)firstName withLastName:(NSString*) lastName{
    
    NSMutableString *rvt = [[NSMutableString alloc] init];
    if (firstName) {
        [rvt appendString:firstName];
    }
    if (lastName) {
        [rvt appendString:lastName];
    }
    return rvt;
}

-(NSArray *)getAddressPersonAry{

    return self.personMAry;
}

@end
