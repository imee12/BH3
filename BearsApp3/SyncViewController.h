//
//  SyncViewController.h
//  BearsApp3
//
//  Created by Imee Cuison on 7/1/15.
//  Copyright (c) 2015 Imee Cuison. All rights reserved.
//


#import <UIKit/UIKit.h>


#import "RFduinoManager.h"

@class RFduinoManager;
@class RFduino;



@interface SyncViewController : UITableViewController<RFduinoManagerDelegate, UITableViewDelegate>



{
    RFduinoManager *rfduinoManager;
    
    
}



@end
