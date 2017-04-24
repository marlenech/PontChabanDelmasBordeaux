//
//  NotificationViewController.m
//  Le Pont Chaban Delmas Bordeaux
//
//  Created by Italik Design on 03/05/2015.
//  Copyright (c) 2015 Italik Design. All rights reserved.
//

#import "NotificationViewController.h"
#import "SWRevealViewController.h"
#import <OneSignal/OneSignal.h>

@import GoogleMobileAds;

@interface NotificationViewController ()


@end

@implementation NotificationViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.title = @"Les Notifications";
    
    NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
    
    //Switch Pont Chaban
    
    if ([standardDefaults objectForKey:@"switchKey"] == nil){
        self.pontaq.on = [standardDefaults boolForKey:@"switchKey"];
        self.pontaq.on = true;
      [OneSignal setSubscription:true];
        self.switchText.text=@"Vous recevez les notifications la veille de la levée du pont, ainsi que toutes les modifications de dernière minute en temps réel";}
    
    
    else if ([standardDefaults boolForKey:@"switchKey"]) {
        self.pontaq.on = [standardDefaults boolForKey:@"switchKey"];
        [OneSignal setSubscription:true];
        self.switchText.text=@"Vous recevez les notifications la veille de la levée du pont, ainsi que toutes les modifications de dernière minute en temps réel";}
    
    else {
        
        self.pontaq.on = false;
        [OneSignal setSubscription:false];
        self.switchText.text=@"Vous ne recevez pas les notifications.";
        
    }
    
    
    
    
    
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.sidebarButton setTarget: self.revealViewController];
        [self.sidebarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

//Pont Aquitaine

- (IBAction)saveSwitchAq:(UISwitch *)sender {
    
    NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
    
    if ([self.pontaq isOn]) {
        [standardDefaults setBool:YES forKey:@"switchKey"];
        [OneSignal setSubscription:true];
        self.switchText.text=@"Vous recevez les notifications la veille de la levée du pont, ainsi que toutes les modifications de dernière minute en temps réel.";
        
        
        
    } else {
        
        [standardDefaults setBool:NO forKey:@"switchKey"];
        [OneSignal setSubscription:false];
        self.switchText.text=@"Vous ne recevez pas les notifications.";
        
    }
    
    [standardDefaults synchronize];
    
}


   






@end

