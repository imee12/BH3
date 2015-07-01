//
//  SmartBear.h
//  BearsApp3
//
//  Created by Imee Cuison on 7/1/15.
//  Copyright (c) 2015 Imee Cuison. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "RFduino.h"




struct AccelPoint { BOOL accelReady; BOOL retransmit; CGFloat x; CGFloat y; CGFloat z; }; typedef struct AccelPoint AccelPoint;



typedef NS_ENUM(Byte, SMARTBEAR_RESPONSES) {
    SMARTBEAR_RESPONSE_NOT_SQUEEZED         = 0x00,
    SMARTBEAR_RESPONSE_SQUEEZED             = 0x01,
    SMARTBEAR_RESPONSE_UNREAD_MESSAGE       = 0x02,
    SMARTBEAR_RESPONSE_NO_UNREAD_MESSAGE    = 0x03,

};

@interface SmartBear : NSObject


@property(strong,nonatomic) RFduino *rfduino;

+(void) notSqueezed: (RFduino *) controller;
+(void) squeezed: (RFduino *) controller;
+(void) unreadMessage: (RFduino *) controller;
+(void) noUnreadMessage: (RFduino *) controller;


@end
