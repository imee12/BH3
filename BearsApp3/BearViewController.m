//
//  BearViewController.m
//  BearsApp3
//
//  Created by Imee Cuison on 7/1/15.
//  Copyright (c) 2015 Imee Cuison. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "BearViewController.h"
#import "SmartBear.h"
#import <Parse/Parse.h>


@interface BearViewController ()

@end

@implementation BearViewController

@synthesize rfduino;

+ (void)load
{
    // customUUID = @"c97433f0-be8f-4dc8-b6f0-5343e6100eb4";
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        
        
        
        
        UIButton *backButton = [UIButton buttonWithType:101];  // left-pointing shape
        [backButton setTitle:@"Disconnect" forState:UIControlStateNormal];
        [backButton addTarget:self action:@selector(disconnect:) forControlEvents:UIControlEventTouchUpInside];
        
        UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
        [[self navigationItem] setLeftBarButtonItem:backItem];
        
        [[self navigationItem] setTitle:@"RFduino LedBtn"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [rfduino setDelegate:self];
    
    UIColor *start = [UIColor colorWithRed:58/255.0 green:108/255.0 blue:183/255.0 alpha:0.15];
    UIColor *stop = [UIColor colorWithRed:58/255.0 green:108/255.0 blue:183/255.0 alpha:0.45];
    
    CAGradientLayer *gradient = [CAGradientLayer layer];
    //gradient.frame = [self.view bounds];
    gradient.frame = CGRectMake(0.0, 0.0, 1024.0, 1024.0);
    gradient.colors = [NSArray arrayWithObjects:(id)start.CGColor, (id)stop.CGColor, nil];
    [self.view.layer insertSublayer:gradient atIndex:0];
    
    PFUser *currentUser = [PFUser currentUser];
    NSLog(@"%@", currentUser);
    
    self.other = [[PFUser currentUser] objectForKey:@"other"];
    NSLog(@"%@", self.other);
    
    // self.recipients = [[NSMutableArray alloc] init];
    
    
    
    //
    //    off = [UIImage imageNamed:@"off.jpg"];
    //    on = [UIImage imageNamed:@"on.jpg"];
}

//- (void)viewDidLayoutSubviews {
//    [self manualLayout];
//}
//
//- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
//{
//    [self manualLayout];
//}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.other = [[PFUser currentUser] objectForKey:@"sender"];
    //
    //    PFQuery *query = [self.other query];
    //
    //    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
    //        if (error) {
    //            NSLog(@"Error %@ %@", error, [error userInfo]);
    //        }
    //        else {
    //            self.other = objects;
    //
    //        }
    //    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)disconnect:(id)sender
{
    NSLog(@"disconnect pressed");
    
    [rfduino disconnect];
}

- (void)sendByte:(uint8_t)byte
{
    uint8_t tx[1] = { byte };
    NSData *data = [NSData dataWithBytes:(void*)&tx length:1];
    [rfduino send:data];
}


- (IBAction)buttonTouchDown:(id)sender {
    // LIGHT TO GO ON
    NSLog(@"TouchDown; LIGHT ON");
    [self sendByte:SMARTBEAR_RESPONSE_UNREAD_MESSAGE];
}




- (IBAction)buttonTouchUpInside:(id)sender {
    // LIGHT GO OFF
    NSLog(@"TouchUpInside; LIGHT OFF");
    [self sendByte: SMARTBEAR_RESPONSE_NO_UNREAD_MESSAGE ];
    
}


- (void)didReceive:(NSData *)data
{
    NSLog(@"RecievedData***");
    
    const uint8_t *value = [data bytes];
    // int len = [data length];
    
    NSLog(@"value = %x", value[0]);
    
    if (value[0])
        //[image1 setImage:on];
        NSLog(@"Bear not squeezed");
    else
        
        //WRITE TO SEND MESSAGE VIA PARSE
        NSLog(@"Bear Squeezed");
    
    [self uploadMessage];
    
    
    //  [image1 setImage:off];
}

#pragma - Helper Methods

-(void) uploadMessage {
    NSLog(@"upload message function..");
    
    PFObject *message = [PFObject objectWithClassName:@"Messages"];
    message[@"sender"] = @"pinkbear@bear.com";
    message[@"other"] = @"brownbear@bear.com";
    // message[@"other"] = [[PFUser currentUser] objectForKey:@"other"];
    message[@"message"] = @"This is a message from SmartBear.";
    [message saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            // The object has been saved.
            NSLog(@"messgae has been saved.");
        } else {
            // There was a problem, check error.description
            NSLog(@"Not working.");
        }
    }];
    
    
    
    
}


- (IBAction)returnUsers_click:(id)sender {
    
    [self performSegueWithIdentifier:@"returnUsersVC" sender:self];
    
}



@end


