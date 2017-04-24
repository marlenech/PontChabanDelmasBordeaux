//
//  LienViewController.h
//  Le Pont Chaban Delmas Bordeaux
//
//  Created by Italik Design on 02/05/2015.
//  Copyright (c) 2015 Italik Design. All rights reserved.
//


#ifndef NotificationViewController_h
#define NotificationViewController_h

#import <UIKit/UIKit.h>

@interface NotificationViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;
@property (strong, nonatomic) IBOutlet UISwitch *pontaq;
@property (weak, nonatomic) IBOutlet UILabel *switchText;


@end

#endif /* NotificationViewController_h */


