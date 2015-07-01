//
//  SmartBear.m
//  BearsApp3
//
//  Created by Imee Cuison on 7/1/15.
//  Copyright (c) 2015 Imee Cuison. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "SmartBear.h"

@implementation SmartBear


+(void) notSqueezed: (RFduino *) controller
{
    NSLog(@"not squeezed");
    UInt8 buf[1] = {0x00};
    
    NSData *data = [[NSData alloc] initWithBytes:buf length:3];
    [controller send:data];
}

+(void) squeezed: (RFduino *) controller
{
    NSLog(@"squeezed");
    UInt8 buf[1] = {0x001};
    
    NSData *data = [[NSData alloc] initWithBytes:buf length:3];
    [controller send:data];
}

+(void) unreadMessage: (RFduino *) controller
{
    NSLog(@"unread message");
    UInt8 buf[1] = {0x00000010};
    
    NSData *data = [[NSData alloc] initWithBytes:buf length:3];
    [controller send:data];
}


+(void) noUnreadMessage: (RFduino *) controller
{
    NSLog(@"no unread message");
    UInt8 buf[1] = {0x00000011};
    
    NSData *data = [[NSData alloc] initWithBytes:buf length:3];
    [controller send:data];
}

- (void)didReceive:(NSData *)data
{
    NSLog(@"RecievedData");
    
    const uint8_t *value = [data bytes];
    // int len = [data length];
    
    NSLog(@"value = %x", value[0]);
    
    if (value[0])
        //[image1 setImage:on];
        NSLog(@"on");
    else
        //        [image1 setImage:off];
        NSLog(@"off");
}


@end
