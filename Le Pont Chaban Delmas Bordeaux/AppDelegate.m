//
//  AppDelegate.m
//  Le Pont Chaban Delmas Bordeaux
//
//  Created by Italik Design on 23/01/2015.
//  Copyright (c) 2015 Italik Design. All rights reserved.
//

#import "AppDelegate.h"

#import <OneSignal/OneSignal.h>


@interface AppDelegate ()

@end

@implementation AppDelegate




- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
   
    [OneSignal initWithLaunchOptions:launchOptions appId:@"de783149-ac22-4a99-a757-355f92db1c68" handleNotificationReceived:^(OSNotification *notification) {
        NSLog(@"Received Notification - %@", notification.payload.notificationID);
    } handleNotificationAction:^(OSNotificationOpenedResult *result) {
        
        // This block gets called when the user reacts to a notification received
        OSNotificationPayload* payload = result.notification.payload;
        
        NSString* messageTitle = @"Le Pont Chaban Delmas";
        NSString* fullMessage = [payload.body copy];
        
        if (payload.additionalData) {
            
            if(payload.title)
                messageTitle = payload.title;
            
            if (result.action.actionID)
                fullMessage = [fullMessage stringByAppendingString:[NSString stringWithFormat:@"\nPressed ButtonId:%@", result.action.actionID]];
        }
        
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:messageTitle
                                                            message:fullMessage
                                                           delegate:self
                                                  cancelButtonTitle:@"Close"
                                                  otherButtonTitles:nil, nil];
        [alertView show];
        
    } settings:@{kOSSettingsKeyInFocusDisplayOption : @(OSNotificationDisplayTypeNotification), kOSSettingsKeyAutoPrompt : @YES}];
    
    [OneSignal IdsAvailable:^(NSString *userId, NSString *pushToken) {
        if(pushToken) {
            NSLog(@"Received push token - %@", pushToken);
            NSLog(@"User ID - %@", userId);
        }
    }];
 
    [GADMobileAds configureWithApplicationID:@"ca-app-pub-6606385851683433/7724698904"];
    

    return YES;
    //Track Push notification opens while launching the app form it
    
   
    
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    //Track notification only if the application opened from Background by clicking on the notification.
    if (application.applicationState == UIApplicationStateInactive) {
            }
    
    //The application was already active when the user got the notification, just show an alert.
    //That should *not* be considered open from Push.
    if (application.applicationState == UIApplicationStateActive) {
        NSDictionary *notificationDict = [userInfo objectForKey:@"aps"];
        NSString *alertString = [notificationDict objectForKey:@"alert"];
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"Push Notification Received" message:alertString delegate:self
                              cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
        [alert show];
    }

}



- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    // Register the deviceToken on Pushbots
    
}









- (void)application:(UIApplication *)application
didReceiveRemoteNotification:(NSDictionary *)userInfo  fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))handler {
    // .. Process notification data
    handler(UIBackgroundFetchResultNewData);
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
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
