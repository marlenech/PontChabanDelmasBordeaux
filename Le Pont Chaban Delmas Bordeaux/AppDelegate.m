//
//  AppDelegate.m
//  Le Pont Chaban Delmas Bordeaux
//
//  Created by Italik Design on 23/01/2015.
//  Copyright (c) 2015 Italik Design. All rights reserved.
//

#import "AppDelegate.h"

#import <OneSignal/OneSignal.h>
#import "PDRatingsView.h"


#define kAppUsedCount @"AppUsedCount"
#define kRemindMeLater @"RemindMeLater"



@interface AppDelegate ()

@end

@implementation AppDelegate




- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [GADMobileAds configureWithApplicationID:@"ca-app-pub-6606385851683433/7724698904"];
   
    
        
        [OneSignal initWithLaunchOptions:launchOptions
                                   appId:@"de783149-ac22-4a99-a757-355f92db1c68"];
        
        
        
        
    NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
    
    NSString *pontType = @"switchKey";
    NSString *pontType2 = @"switchKey2";
    NSString *pontType3 = @"switchKey3";
    NSString *pontType4 = @"switchKey4";
    NSString *pontType5 = @"switchKey5";
    
    if([standardDefaults objectForKey:kRemindMeLater] == nil) {
        [standardDefaults setBool:YES forKey:kRemindMeLater];
    }
    
    if([standardDefaults boolForKey:pontType] == YES) {
        
        // Do Something
        [OneSignal sendTag:@"0630a0930" value:@"0630a0930"];
        [OneSignal deleteTag:@"aucun"];
    }
    
    else if ([standardDefaults objectForKey:pontType] == nil){
        [OneSignal sendTag:@"0630a0930" value:@"0630a0930"];
        
        // Do Something Else
        [OneSignal deleteTag:@"aucun"];
    }
    else {
        [OneSignal sendTag:@"aucun" value:@"aucun"];
        [OneSignal deleteTag:@"0630a0930"];
        [standardDefaults setBool:NO forKey:@"switchKey"];
    }
    
    if([standardDefaults boolForKey:pontType2] == YES) {
        
        // Do Something
        [OneSignal sendTag:@"0930a1630" value:@"0930a1630"];
        [OneSignal deleteTag:@"aucun"];
    }
    
    else if ([standardDefaults objectForKey:pontType2] == nil){
        [OneSignal sendTag:@"0930a1630" value:@"0930a1630"];
        
        // Do Something Else
        [OneSignal deleteTag:@"aucun"];
    }
    else {
        [OneSignal sendTag:@"aucun" value:@"aucun"];
        [OneSignal deleteTag:@"0930a1630"];
        [standardDefaults setBool:NO forKey:@"switchKey2"];
    }
    
    if([standardDefaults boolForKey:pontType3] == YES) {
        
        // Do Something
        [OneSignal sendTag:@"1630a1930" value:@"1630a1930"];
        [OneSignal deleteTag:@"aucun"];
    }
    
    else if ([standardDefaults objectForKey:pontType3] == nil){
        [OneSignal sendTag:@"1630a1930" value:@"1630a1930"];
        
        // Do Something Else
        [OneSignal deleteTag:@"aucun"];
    }
    else {
        [OneSignal sendTag:@"aucun" value:@"aucun"];
        [OneSignal deleteTag:@"1630a1930"];
        [standardDefaults setBool:NO forKey:@"switchKey3"];
    }
    
    if([standardDefaults boolForKey:pontType4] == YES) {
        
        // Do Something
        [OneSignal sendTag:@"1930a0630" value:@"1930a0630"];
        [OneSignal deleteTag:@"aucun"];
    }
    
    else if ([standardDefaults objectForKey:pontType4] == nil){
        [OneSignal sendTag:@"1930a0630" value:@"1930a0630"];
        
        // Do Something Else
        [OneSignal deleteTag:@"aucun"];
    }
    else {
        [OneSignal sendTag:@"aucun" value:@"aucun"];
        [OneSignal deleteTag:@"1930a0630"];
        [standardDefaults setBool:NO forKey:@"switchKey4"];
    }
    
    if([standardDefaults boolForKey:pontType5] == YES) {
        
        // Do Something
        [OneSignal sendTag:@"weekend" value:@"weekend"];
        [OneSignal deleteTag:@"aucun"];
    }
    
    else if ([standardDefaults objectForKey:pontType5] == nil){
        [OneSignal sendTag:@"weekend" value:@"weekend"];
        
        // Do Something Else
        [OneSignal deleteTag:@"aucun"];
    }
    else {
        [OneSignal sendTag:@"aucun" value:@"aucun"];
        [OneSignal deleteTag:@"weekend"];
        [standardDefaults setBool:NO forKey:@"switchKey5"];
    }
    

        
    
        
        
 
    
    

    return YES;
    //Track Push notification opens while launching the app form it
    
   
    
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    //ALERTVIEW RATING
    
    NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
    
    if([standardDefaults boolForKey:kRemindMeLater] == YES) {
        
        UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
        
        [PDRatingsView ratingsWithAppId:@"663031214" countAppUsed:5 onViewController:rootViewController];
    }
    
    
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
