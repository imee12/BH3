//
//  FindViewController.m
//  BearsApp3
//
//  Created by Imee Cuison on 7/1/15.
//  Copyright (c) 2015 Imee Cuison. All rights reserved.
//

#import "FindViewController.h"

//#import "SyncViewController.h"
#import "RFduinoManager.h"
#import "RFduino.h"

@interface FindViewController ()

{
   // bool editingRow;
    bool loadService;
    
    
    
}


@end

@implementation FindViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    rfduinoManager = RFduinoManager.sharedRFduinoManager;
    
    rfduinoManager.delegate = self;

    
    

}



- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    
    rfduinoManager = RFduinoManager.sharedRFduinoManager;
    
    
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

- (void)didLoadServiceRFduino:(RFduino *)rfduino
{
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    UsersViewController *viewController =[storyboard instantiateViewControllerWithIdentifier:@"UsersViewController"];
//
//    viewController.rfduino = rfduino;
//
//    loadService = true;
//    [[self navigationController] pushViewController:viewController animated:YES];
}


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

- (IBAction)FindBtn_click:(id)sender {
    
    
}




- (IBAction)findBtn_click:(id)sender {
    
    
    
    NSLog(@"Find Button Pushed");
  //  rfduinoManager = RFduinoManager.sharedRFduinoManager;
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    
    
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
