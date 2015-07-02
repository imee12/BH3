//
//  FindViewController.m
//  BearsApp3
//
//  Created by Imee Cuison on 7/1/15.
//  Copyright (c) 2015 Imee Cuison. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "FindViewController.h"

#import "RFduinoManager.h"
#import "RFduino.h"
//#import "SmartBear.h"
#import <Parse/Parse.h>
#import "BearViewController.h"

#import "BearsApp3-Swift.h"

@interface FindViewController ()

{
   // bool editingRow;
    bool loadService;
    
    
    
}


@end

@implementation FindViewController

@synthesize rfduino;


+ (void)load
{
    // customUUID = @"c97433f0-be8f-4dc8-b6f0-5343e6100eb4";
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    rfduinoManager = RFduinoManager.sharedRFduinoManager;
    
    rfduinoManager.delegate = self;

    [rfduino setDelegate:self];

    self.navigationItem.hidesBackButton = YES;
    

}



- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    
    rfduinoManager = RFduinoManager.sharedRFduinoManager;
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - RfduinoDiscoveryDelegate methods

#if TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR

- (void)shouldDisplayAlertTitled:(NSString *)title messageBody:(NSString *)body
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:body
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

#endif

- (void)didDiscoverRFduino:(RFduino *)rfduino
{
    NSLog(@"didDiscoverRFduino");
//    if (! editingRow) {
//        NSLog(@"reloadData");
//        [self.tableView reloadData];
    
     [rfduinoManager connectRFduino:rfduino];
//    }
}

- (void)didUpdateDiscoveredRFduino:(RFduino *)rfduino
{
    // NSLog(@"didUpdateRFduino");
//    if (! editingRow) {
//        [self.tableView reloadData];
//    }
}

- (void)didConnectRFduino:(RFduino *)rfduino
{
    NSLog(@"didConnectRFduino");
    
    [rfduinoManager stopScan];
    

    
    
    loadService = false;
}

//- (void)didLoadServiceRFduino:(RFduino *)rfduino
//{
////    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
////    UsersViewController *viewController =[storyboard instantiateViewControllerWithIdentifier:@"UsersViewController"];
////
////    viewController.rfduino = rfduino;
////
////    loadService = true;
////    [[self navigationController] pushViewController:viewController animated:YES];
//}


- (void)didDisconnectRFduino:(RFduino *)rfduino
{
    NSLog(@"didDisconnectRFduino");
    
//    if (loadService) {
//        [[self navigationController] popViewControllerAnimated:YES];
//    }
//    
//    [rfduinoManager startScan];
//    [self.tableView reloadData];
}

- (void)sendByte:(uint8_t)byte
{
    uint8_t tx[1] = { byte };
    NSData *data = [NSData dataWithBytes:(void*)&tx length:1];
    [rfduino send:data];
}


//- (void)didReceive:(NSData *)data
//{
//    NSLog(@"RecievedData***");
//    
//    const uint8_t *value = [data bytes];
//    // int len = [data length];
//    
//    NSLog(@"value = %x", value[0]);
//    
//    if (value[0])
//        
//        //[image1 setImage:on];
//        
//        //WRITE TO SEND MESSAGE VIA PARSE
//        NSLog(@"Bear squeezed");
//    else
//        
//        
//        NSLog(@"Bear not Squeezed");
//    
//  //  [self uploadMessage];
//  //
//    
//    
//    
//   //   [image1 setImage:off];
//}


- (void)didLoadServiceRFduino:(RFduino *)rfduino
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    BearViewController *viewController =[storyboard instantiateViewControllerWithIdentifier:@"BearViewController"];
    
    viewController.rfduino = rfduino;
    
    loadService = true;
    [[self navigationController] pushViewController:viewController animated:YES];


    
}


- (void)refreshData
{
    NSLog(@"refreshData called");
    [self viewWillAppear:true];
}



- (IBAction)findBtn_click:(id)sender {
    
    
    
    NSLog(@"Find Button Pushed");
 [self performSegueWithIdentifier:@"goToUsers2" sender:self];
    
    
    
    
 //  SyncViewController *viewController = [[SyncViewController alloc] init];
    
//    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:viewController];
//    [self.window setRootViewController:navController];
//    
//    navController.navigationBar.tintColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
//    
//    self.window.backgroundColor = [UIColor whiteColor];
//    [self.window makeKeyAndVisible];
    

    
}


@end
