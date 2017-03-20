//
//  AppDelegate.h
//  Le Pont Chaban Delmas Bordeaux
//
//  Created by Italik Design on 23/01/2015.
//  Copyright (c) 2015 Italik Design. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UserNotifications/UserNotifications.h>




@import GoogleMobileAds;

@interface AppDelegate : UIResponder <UIApplicationDelegate, UNUserNotificationCenterDelegate>
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;

@property (strong, nonatomic) UIWindow *window;



@end

