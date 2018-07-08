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
@property (strong, nonatomic) IBOutlet UISwitch *premier;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UISwitch *deuxieme;
@property (strong, nonatomic) IBOutlet UISwitch *troisieme;
@property (strong, nonatomic) IBOutlet UISwitch *quatrieme;
@property (strong, nonatomic) IBOutlet UISwitch *cinquieme;
@property (weak, nonatomic) IBOutlet UILabel *switchText;
@property (weak, nonatomic) IBOutlet UILabel *switchText2;
@property (weak, nonatomic) IBOutlet UILabel *switchText3;
@property (weak, nonatomic) IBOutlet UILabel *switchText4;
@property (weak, nonatomic) IBOutlet UILabel *switchText5;


@end

#endif /* NotificationViewController_h */


