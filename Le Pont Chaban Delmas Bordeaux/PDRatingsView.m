//
//  PDRatingsView.m
//  RatingsSample
//
//  Created by Parag on 12/15/16.
//  Copyright © 2016 Parag. All rights reserved.
//

#import "PDRatingsView.h"

#define kAppUsedCount @"AppUsedCount"
#define kRemindMeLater @"RemindMeLater"


@interface PDRatingsView()
{
    UIViewController *viewController;
}

@end

@implementation PDRatingsView
static PDRatingsView *ratings;

@synthesize alertController1;
@synthesize alertController2;
@synthesize appID;
@synthesize countAppUsed;
@synthesize preferences;
@synthesize delegate;


#pragma mark For Creating Synchronized Singleton Class
+(PDRatingsView *) ratingsWithAppId:(NSString*)appId countAppUsed:(NSInteger)count onViewController:(UIViewController*)_viewController
{
    @synchronized(self)
    {
        if(!ratings)
        {
           ratings = [[PDRatingsView alloc] init];
            ratings.appID = appId;
            ratings.countAppUsed = count;
            ratings->viewController = _viewController;
        }
        
        [ratings checkCountForAppUsed];
        return ratings;
    }
    return nil;
}


-(id)init
{
    if(self = [super init])
    {
        preferences = [NSUserDefaults standardUserDefaults];
        [preferences setBool:YES forKey:kRemindMeLater];
        [preferences synchronize];
    }
    
    if([preferences objectForKey:kRemindMeLater] == nil) {
        [preferences setBool:YES forKey:kRemindMeLater];
    }
    
    return self;
}

-(void)addAlert2ForSelectingRatingOrRemind
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Cette appli vous aide dans vos trajets quotidiens ?" message:@"Soutenez la en lui attribuant une note sur l'Apple Store dès maintenant !" preferredStyle:UIAlertControllerStyleAlert];
    
    
    UIAlertAction* rateSpintally = [UIAlertAction actionWithTitle:@"Notez maintenant" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
//        if([delegate respondsToSelector:@selector(ratingsSelectedFor:)])
//        {
//            [delegate ratingsSelectedFor:PDRatingsSelectedToRate];
//        }

        NSURL *url =  [NSURL URLWithString:[NSString stringWithFormat:@"itms-apps://itunes.apple.com/%@%d",([[UIDevice currentDevice].systemVersion floatValue] <= 7.0f)? iOS7AppStoreURLFormat: iOSAppStoreURLFormat, appID.integerValue]];
        
        
        if([[UIDevice currentDevice].systemVersion floatValue] >= 10.0)
        {
        [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:^(BOOL success) {
            
            [preferences setBool:NO forKey:kRemindMeLater];
            [preferences synchronize];
        }];
        }
        else
        {
            [[UIApplication sharedApplication] openURL:url];
            [preferences setBool:NO forKey:kRemindMeLater];
            [preferences synchronize];
        }
        
    }];
    [alertController addAction:rateSpintally];
    
    UIAlertAction* remindLater = [UIAlertAction actionWithTitle:@"Me le rappeler plus tard" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        [preferences setBool:YES forKey:kRemindMeLater];
        [preferences synchronize];
        
        if([delegate respondsToSelector:@selector(ratingsSelectedFor:)])
        {
            [delegate ratingsSelectedFor:PDRatingsSelectedToRemindLater];
        }
    }];
    [alertController addAction:remindLater];
    
    
    UIAlertAction* noThanks = [UIAlertAction actionWithTitle:@"Non merci" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        [preferences setBool:NO forKey:kRemindMeLater];
        [preferences synchronize];
        
        if([delegate respondsToSelector:@selector(ratingsSelectedFor:)])
        {
            [delegate ratingsSelectedFor:PDRatingsSelectedNoThanks];
        }
        
    }];
    [alertController addAction:noThanks];
    
    if(viewController)
    [viewController presentViewController:alertController animated:YES completion:nil];
    
}

-(void)checkCountForAppUsed
{
    assert(countAppUsed);
    NSInteger appUsedCount = [preferences integerForKey:kAppUsedCount];
    if(appUsedCount >= 0 && appUsedCount < countAppUsed)
    {
        appUsedCount ++;
        [preferences setInteger:appUsedCount forKey:kAppUsedCount];
        [preferences synchronize];
    }
    else
    {
        if(appUsedCount == countAppUsed && [preferences boolForKey:kRemindMeLater])
        {
        
            
          // show first alert
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Cette appli vous aide dans vos trajets quotidiens ?" message:@"Soutenez la en lui attribuant une note sur l'Apple Store dès maintenant !" preferredStyle:UIAlertControllerStyleAlert];
            
            
            UIAlertAction* rateSpintally = [UIAlertAction actionWithTitle:@"Notez maintenant" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                
                //        if([delegate respondsToSelector:@selector(ratingsSelectedFor:)])
                //        {
                //            [delegate ratingsSelectedFor:PDRatingsSelectedToRate];
                //        }
                
                NSURL *url =  [NSURL URLWithString:[NSString stringWithFormat:@"itms-apps://itunes.apple.com/%@%d",([[UIDevice currentDevice].systemVersion floatValue] <= 7.0f)? iOS7AppStoreURLFormat: iOSAppStoreURLFormat, appID.integerValue]];
                
                
                if([[UIDevice currentDevice].systemVersion floatValue] >= 10.0)
                {
                    [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:^(BOOL success) {
                        
                        [preferences setBool:NO forKey:kRemindMeLater];
                        [preferences synchronize];
                    }];
                }
                else
                {
                    [[UIApplication sharedApplication] openURL:url];
                    [preferences setBool:NO forKey:kRemindMeLater];
                    [preferences synchronize];
                }
                
            }];
            [alertController addAction:rateSpintally];
            
            UIAlertAction* remindLater = [UIAlertAction actionWithTitle:@"Me le rappeler plus tard" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                
                [preferences setBool:YES forKey:kRemindMeLater];
                [preferences synchronize];
                
                if([delegate respondsToSelector:@selector(ratingsSelectedFor:)])
                {
                    [delegate ratingsSelectedFor:PDRatingsSelectedToRemindLater];
                }
            }];
            [alertController addAction:remindLater];
            
            
            UIAlertAction* noThanks = [UIAlertAction actionWithTitle:@"Non merci" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                
                [preferences setBool:NO forKey:kRemindMeLater];
                [preferences synchronize];
                
                if([delegate respondsToSelector:@selector(ratingsSelectedFor:)])
                {
                    [delegate ratingsSelectedFor:PDRatingsSelectedNoThanks];
                }
                
            }];
            [alertController addAction:noThanks];
            
            if(viewController)
                [viewController presentViewController:alertController animated:YES completion:nil];
    }
    }
}

-(void)dealloc
{

}




@end
