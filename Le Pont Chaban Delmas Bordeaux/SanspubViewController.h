//
//  Transaction.h
//  PontsBordeaux
//
//  Created by Italik Design on 26/03/2017.
//  Copyright © 2017 italikdesign. All rights reserved.
//

#ifndef Transaction_h
#define Transaction_h
#import <UIKit/UIKit.h>

#import <StoreKit/StoreKit.h>



@import GoogleMobileAds;

@interface SanspubViewController : UIViewController{
    IBOutlet UIButton *removeAdsButton;
}

    
    

@property (nonatomic, assign) BOOL areAdsRemoved;

- (IBAction)restore;
- (IBAction)tapsRemoveAds;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;
@end
#endif /* Transaction_h */
