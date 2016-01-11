//
//  KInternetTime.m
//  SK-iOS-BaseFunction
//
//  Created by kai.shang on 16/1/11.
//  Copyright © 2016年 SK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KInternetTime.h"

static KInternetTime*   __instance = nil;

@interface KInternetTime()
{
    TRequsetStatus  status;
}

@property(nonatomic, retain) NSDate *lastTime;
@end


@implementation KInternetTime



+(instancetype)sharedInstance
{
    @synchronized(self)
    {
        if (__instance==nil) {
            __instance = [[self alloc]init];
        }
    }
    return __instance;
}

-(id)init
{
    self =[super init];
    if (self) {
        status          = EStatusNone;
    }
    return self;
}

-(void)startRequest
{
    if (status==EStatusNone) {
        status = EStatusRequesting;
        [self performSelectorInBackground:@selector(requestThread:) withObject:nil];
    }
}

-(void)cancelRequest
{
    if (status!=EStatusRequestSuccess) {
        status = EStatusNone;
    }
}

-(void)requestThread:(id)sender
{
    NSArray*   urlArry = [[NSArray alloc]initWithObjects:
                          @"https://www.baidu.com",
                          @"https://www.google.com/",
                          nil];
    NSInteger  index = 0;
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    
    while (status==EStatusRequesting||status==EStatusRequestFailure) {
        
        status = EStatusRequesting;
        
        NSURL *url=[NSURL URLWithString:[urlArry objectAtIndex:index]];
        NSURLRequest *request=[NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10];
        
        [NSURLConnection sendAsynchronousRequest:request
                                           queue:queue
                               completionHandler:^(NSURLResponse *response, NSData *data, NSError *error){
                                   if (error) {
                                       if (status!=EStatusNone) {
                                           status = EStatusRequestFailure;
                                       }
                                       
                                   }else{
                                       
                                       [self receiveResponse:response];
                                   }
                               }];
    
        
        index++;
        if (index>=[urlArry count]) {
            index = 0;
        }
        
        [NSThread sleepForTimeInterval:5];
        
        while (status==EStatusRequesting) {
            [NSThread sleepForTimeInterval:1];
        }
    }
    
}


- (void)receiveResponse:(NSURLResponse *)response
{
//    NSLog(@"response%@",response);
    NSHTTPURLResponse *httpResponse=(NSHTTPURLResponse *)response;
    if ([response respondsToSelector:@selector(allHeaderFields)]) {
        NSDictionary *dic=[httpResponse allHeaderFields];
        NSString *lastUpdate = [dic objectForKey:@"Date"];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_GB"]];
        [formatter setDateFormat:@"EEE, dd MMM yyyy HH:mm:ss zzz"];
        self.lastTime = [formatter dateFromString:lastUpdate];

        [formatter setDateFormat:@"y-M-d"];
        status = EStatusRequestSuccess;
        
        if (self.notiBlock != nil && self.lastTime) {
            self.notiBlock(self.lastTime);
        }
    }
}

-(TRequsetStatus)currentStatus
{
    return status;
}

@end
