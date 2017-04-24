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
        
        NSString *pontTypeAq = @"switchKey";
    
        
        if([standardDefaults objectForKey:kRemindMeLater] == nil) {
            [standardDefaults setBool:YES forKey:kRemindMeLater];
        }
        
        if([standardDefaults boolForKey:pontTypeAq] == YES) {
            [OneSignal setSubscription:true];
            
            // Do Something
                    }
        
        else if ([standardDefaults objectForKey:pontTypeAq] == nil){
            [OneSignal setSubscription:true];
            
        }
        else {
            [OneSignal setSubscription:false];
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
