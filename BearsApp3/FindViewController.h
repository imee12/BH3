//
//  FindViewController.h
//  BearsApp3
//
//  Created by Imee Cuison on 7/1/15.
//  Copyright (c) 2015 Imee Cuison. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RFduinoManager.h"
#import "RFduino.h"
#import "SmartBear.h"
#import <Parse/Parse.h>

@class RFduinoManager;
@class RFduino;




@interface FindViewController : UIViewController <RFduinoManagerDelegate, RFduinoDelegate>
{
    RFduinoManager *rfduinoManager;
    bool wasScanning;
  //  bool loadService;

    
    
}

//-(void)didDiscoverRFduino:(RFduino *)rfduino;
//-(void)didUpdateDiscoveredRFduino:(RFduino *)rfduino;
//-(void)didConnectRFduino:(RFduino *)rfduino;
//-(void)didLoadServiceRFduino:(RFduino *)rfduino;
//-(void)didDisconnectRFduino:(RFduino *)rfduino;
//-(void)didReceive:(NSData *)data;


@property (weak, nonatomic) IBOutlet UIButton *findBtn;
@property (strong, nonatomic) UIWindow *window;

@property(strong,nonatomic) RFduino *rfduino;

@end
