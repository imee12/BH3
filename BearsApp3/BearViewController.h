//
//  BearViewController.h
//  BearsApp3
//
//  Created by Imee Cuison on 7/1/15.
//  Copyright (c) 2015 Imee Cuison. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RFduino.h"
#import "SmartBear.h"
#import <Parse/Parse.h>


//
//typedef NS_ENUM(Byte, SMARTBEAR_RESPONSES) {
//    SMARTBEAR_RESPONSE_UNREAD_MESSAGE       = 0x0000010,
//    SMARTBEAR_RESPONSE_NO_UNREAD_MESSAGE    = 0x0000011,
//    
//};

@interface BearViewController : UIViewController <RFduinoDelegate>
{
    
    
    __weak IBOutlet UILabel *syncedLabel;
    __weak IBOutlet UILabel *label1;
    __weak IBOutlet UIButton *button1;
    
    __weak IBOutlet UILabel *label2;
    __weak IBOutlet UIImageView *image1;
    
    UIImage *off;
    UIImage *on;
    
    
    
    
    
}






@property(strong,nonatomic) RFduino *rfduino;


@property (weak, nonatomic) IBOutlet UIButton *returnToUsers_click;

//- (IBAction)buttonTouchDown:(id)sender;
//- (IBAction)buttonTouchUpInside:(id)sender;

@property (nonatomic, strong) PFRelation *other;
@property (nonatomic, strong) NSData *bearMessageData;
@property (nonatomic, strong) PFUser *currentUser;
@property (nonatomic, strong) PFObject *message;
@property (nonatomic, strong) PFFile *file;
@property (nonatomic, strong) NSString *bearMessage;

-(void) uploadMessage;


@end

